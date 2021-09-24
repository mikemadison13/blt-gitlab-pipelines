#!/usr/bin/env bash

set -ev

vendor/bin/blt artifact:deploy --commit-msg "Automated commit by Gitlab Pipelines for Build $CI_JOB_ID" --branch "$CI_COMMIT_REF_NAME-build" --no-interaction --verbose

set +v
