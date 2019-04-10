#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "Not a pull request"
  if [ "$TRAVIS_BRANCH" = "master" ] || [ "$TRAVIS_BRANCH" = "stage" ]; then
    echo "yay on master or staging "
  else
    echo "Not a PR but different branch"
  fi
else
  echo "It is a PR!!"
fi
# Set default staging values which will be used by feature branches and pull request builds (As they are not deployed)

export IMAGE_NAME=quarticai/contexalyze_prod;
export DEFAULT_IMAGE="quarticai/contexalyze_stg:base_latest";
export ENV="staging";

# if current build branch belongs to [master, staging, pov, swiftwater] set respective values to be used by build and deploy
echo "inside script"
echo "$TRAVIS_BRANCH"