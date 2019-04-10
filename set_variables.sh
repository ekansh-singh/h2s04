#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  # Settings for not a Pull Request
  if [ "$TRAVIS_BRANCH" = "master" ] || [ "$TRAVIS_BRANCH" = "staging" ]; then
    # Settings for 4 main branches
    # echo "yay on master or staging "
    case "$TRAVIS_BRANCH" in
    'master')
      echo "Inside master branch"
    ;;
    'staging')
      echo "Inside staging branch"
    ;;
    'restart')
      echo "restart"
    ;;
    esac
  else
    # Settings for other branches
    echo "Not a PR but different branch"
  fi
else
  # Settings for Pull Request
  echo "It is a PR!!"
fi
# Set default staging values which will be used by feature branches and pull request builds (As they are not deployed)

export IMAGE_NAME=quarticai/contexalyze_prod;
export DEFAULT_IMAGE="quarticai/contexalyze_stg:base_latest";
export ENV="staging";

# if current build branch belongs to [master, staging, pov, swiftwater] set respective values to be used by build and deploy
echo "inside script"
echo "$TRAVIS_BRANCH"