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
echo "CREATE DATABASE IF NOT EXISTS \`drupal8\`;" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "CREATE USER 'drupal8'@'%' IDENTIFIED BY 'drupal8';" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "GRANT ALL ON drupal8.* TO 'drupal8'@'%';" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql
echo "FLUSH PRIVILEGES;" | mysql --user=root --password="$MYSQL_ROOT_PASSWORD" --host=mysql

set +v
