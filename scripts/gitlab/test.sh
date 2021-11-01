#!/usr/bin/env bash

set -ev

# Executes the BLT Tests command inside the container
vendor/bin/blt tests --define drush.alias='${drush.aliases.ci}' -D behat.web-driver=chrome --no-interaction --ansi --verbose

set +v
