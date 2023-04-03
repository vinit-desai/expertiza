apt-get update
curl -sL https://deb.nodesource.com/setup_14.x | sh -
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y default-mysql-client
npm install -g bower
bower install --allow-root
apt-get install default-libmysqlclient-dev
gem install rspec