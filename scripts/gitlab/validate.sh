#!/usr/bin/env bash

set -ev

# Executes the BLT Validate command inside the container
vendor/bin/blt validate --define drush.alias='${drush.aliases.ci}' --ansi --verbose

set +v
