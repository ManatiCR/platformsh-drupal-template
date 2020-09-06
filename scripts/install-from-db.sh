#!/bin/bash
if [ ! -f db_site.sql.gz ]; then
  platform db:dump --gzip --file=db_site.sql.gz -e master
fi
chirripo drush cr
echo "Drop Database..."
chirripo drush sql:drop -- -y
echo "Import database..."
gunzip -c db_site.sql.gz | chirripo drush sqlc
echo "Update database..."
chirripo drush updb -- -y
echo "Importing config..."
chirripo drush cim -- -y
echo "Cleaning cache..."
chirripo drush cr
echo "Sanitizing database..."
chirripo drush sqlsan -- --sanitize-password=admin -y
echo "Generating an admin one time login link..."
chirripo drush uli