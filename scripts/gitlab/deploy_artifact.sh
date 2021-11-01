#!/usr/bin/env bash

set -ev

# Install Open SSH Client
apt-get update -y && apt-get install openssh-client -y

# Add and configure the SSH Key. Note: SSH Private Key must be stored as SSH_KEY CI/CD Variable
eval $(ssh-agent -s)
ssh-add <(echo "$SSH_KEY")
mkdir -p ~/.ssh
rm -rf ~/.ssh/known_hosts
ssh-keyscan -H 'acquia.com' >> ~/.ssh/known_hosts
ssh-keyscan acquia.com | sort -u - ~/.ssh/known_hosts -o ~/.ssh/known_hosts
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config

# Execute BLT Deploy to push into Acquia Hosting
vendor/bin/blt artifact:deploy --commit-msg "Automated commit by Gitlab Pipelines for Build $CI_JOB_ID" --branch "$CI_COMMIT_REF_NAME-build" --no-interaction --verbose

set +v
