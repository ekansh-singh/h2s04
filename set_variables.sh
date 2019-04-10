#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
# Settings for NON Pull Request triggers
  BRANCH=$TRAVIS_BRANCH
else
# Settings for Pull Request triggers
  echo "It is a PR!!"
  IFS='_' read -ra MAIN_BRANCH <<< "$TRAVIS_PULL_REQUEST_BRANCH"
  BRANCH=$MAIN_BRANCH
fi

case "$BRANCH" in
'master')
  echo "Inside master branch"
  export IMAGE_NAME=quarticai/contexalyze_prod;
  export DEFAULT_IMAGE="quarticai/contexalyze_prod:base_latest";
  export ENV="production";
;;
'PLAT-861')
  echo "Inside PLAT-861 branch"
  export IMAGE_NAME=quarticai/contexalyze_pov_prod;
  export DEFAULT_IMAGE="quarticai/contexalyze_prod:base_latest";
  export ENV="production-pov";
;;
'swiftwater-ui')
  echo "Inside swiftwater-ui branch"
  export IMAGE_NAME=quarticai/contexalyze_swiftwater_prod;
  export DEFAULT_IMAGE="quarticai/contexalyze_prod:base_latest";
  export ENV="production-swiftwater";
;;
*)
  echo "Inside Feature Branch"
  echo "$TRAVIS_BRANCH"
  export IMAGE_NAME=quarticai/contexalyze_stg;
  export DEFAULT_IMAGE="quarticai/contexalyze_stg:base_latest";
  export ENV="staging";
;;
esac







# Set default staging values which will be used by feature branches and pull request builds (As they are not deployed)

# export IMAGE_NAME=quarticai/contexalyze_prod;
# export DEFAULT_IMAGE="quarticai/contexalyze_stg:base_latest";
# export ENV="staging";

# if current build branch belongs to [master, staging, pov, swiftwater] set respective values to be used by build and deploy
# echo "inside script"