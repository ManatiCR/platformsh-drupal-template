#!/usr/bin/env bash
chirripo drush cc drush
echo "Installing the site..."
chirripo drush si -- bloom --account-pass=admin --site-name="Drupal 9" --existing-config -y
chirripo drush cim -- -y; chirripo drush cim -- -y;

# Change CUSTOMTHEME by your own theme folder.
if [ -f ./themes/custom/CUSTOMTHEME/package.json ]; then
  cd ./themes/custom/CUSTOMTHEME
  if [ ! -d ./node_modules ]; then npm install; fi
  npm run build
fi

echo "Cleaning cache..."
chirripo drush cr
