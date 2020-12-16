#!/bin/sh

# Only run ssh-agent if the key and git url is set.
if [[ "$ACQUIA_PRIVATE_KEY" ]] && [[ "$ACQUIA_GIT_URL" ]]; then
  command -v ssh-agent >/dev/null || ( apt-get update -y && apt-get install openssh-client -y )
  eval $(ssh-agent -s)
  cat $ACQUIA_PRIVATE_KEY | tr -d '\r' | ssh-add -
  mkdir -p ~/.ssh
  chmod -R 700 ~/.ssh
  ssh-keyscan $ACQUIA_GIT_URL >> ~/.ssh/known_hosts
  chmod 644 ~/.ssh/known_hosts
fi
