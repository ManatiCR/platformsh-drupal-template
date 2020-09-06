#!/bin/bash
# Generate a new ramdom uuid the first time you create a project.
# You could use the `uuidgen` bash command to get new one!!.
SITE_UUID="e6191fd0-ba37-4233-a58f-6401649f27eb"
chirripo drush cc drush
echo "Installing the site..."
chirripo drush si -- bloom --account-pass=admin --site-name="Drupal8" -y
echo "Setting the site uuid..."
chirripo drush config:set -- system.site uuid "$SITE_UUID" -y
if [ -f ./config/sync/core.extension.yml ] ; then chirripo drush cim -- -y ; chirripo drush cim -- -y ; fi
echo "Cleaning cache..."
chirripo drush cr

# Change CUSTOMTHEME by your theme folder
if [ -f ./themes/custom/CUSTOMTHEME/package.json ] ; then
  cd ./themes/custom/CUSTOMTHEME
  if [ ! -d ./node_modules ] ; then npm install ; fi
  npm run build
  echo "Cleaning cache..."
  chirripo drush cr
fi
