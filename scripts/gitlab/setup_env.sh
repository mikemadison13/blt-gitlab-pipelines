#!/usr/bin/env bash

set -ev

export PATH=${COMPOSER_BIN}:$PATH

# Set the git configuration
git config --global user.name "gitlab-CI"
git config --global user.email "noreply@gitlab.com"

# Up the PHP Memory Limit
touch /usr/local/etc/php/conf.d/docker-php-ext-ci.ini
echo 'memory_limit = -1' >> /usr/local/etc/php/conf.d/docker-php-ext-ci.ini

# Create a MySQL database for drupal to use
echo "CREATE DATABASE IF NOT EXISTS \`drupal\`;" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "CREATE USER 'drupal'@'%' IDENTIFIED BY 'drupal';" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "GRANT ALL ON drupal.* TO 'drupal'@'%';" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "FLUSH PRIVILEGES;" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql

# Install Node JS and NPM
apt-get update
apt-get install -y ca-certificates curl gnupg libxss1
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_${NODE_VERSION} nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update
apt-get install nodejs -y

# Install Google Chrome and Cleanup Binary
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

set +v
