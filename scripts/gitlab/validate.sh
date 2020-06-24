#!/usr/bin/env bash

set -ev

vendor/bin/blt validate --define drush.alias='${drush.aliases.ci}' --ansi --verbose

set +v
