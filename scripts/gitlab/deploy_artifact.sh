#!/usr/bin/env bash

set -ev

vendor/bin/blt artifact:deploy --commit-msg "Automated commit by Gitlab Pipelines for Build $BUILD_BUILDID" --branch "$BUILD_SOURCEBRANCH-build" --no-interaction --verbose

set +v
