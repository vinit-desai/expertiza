#!/bin/bash                                                                                                                          
echo "Running bundle install..."
bundle install
echo "Configuring yaml files..."
cp ./config/secrets.yml.example ./config/secrets.yml
# Remove default development configuration
sed '7,9d' ./config/database.yml.example  > ./config/database.yml
echo "
development:
  adapter: mysql2
  host: mysql
  username: root
  password: expertiza
  database: expertiza_production" >> ./config/database.yml
# Populate database
echo "Inserting scrubbed db into database... this may take awhile!"
mysql --user=root --password=expertiza --host=mysql expertiza_production < ./expertiza.sql
# Run initializing commands
echo "Running migrations..."
bundle exec rake db:migrate RAILS_ENV=development