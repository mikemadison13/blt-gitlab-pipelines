#!/usr/bin/env bash

set -ev

# Executes blt setup to install Drupal inside the container
vendor/bin/blt setup --define drush.alias='${drush.aliases.ci}' --environment=ci --no-interaction --ansi --verbose

set +v
