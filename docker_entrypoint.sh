#!/bin/bash                                                                                                                          
echo "Initializing container"
cp ./config/secrets.yml.example ./config/secrets.yml
# Remove default development configuration
sed '7,9d' ./config/database.yml.example  > ./config/database.yml
echo "development:
\tadapter: mysql2
\thost: mysql
\tusername: root
\tpassword: expertiza
\tdatabase: expertiza_production" >> ./config/database.yml
# Populate database
echo "Inserting scrubbed db into database... this may take awhile!"
mysql --user=root --password=expertiza --host=mysql expertiza_production < ./expertiza.sql
# Run initializing commands
bundle exec rake db:migrate RAILS_ENV=development