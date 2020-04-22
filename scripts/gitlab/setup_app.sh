#!/usr/bin/env bash

set -ev

vendor/bin/blt setup --define drush.alias='${drush.aliases.ci}' --environment=ci --no-interaction --ansi --verbose

set +v
