#!/bin/bash

# Case insensitive and Mater branch PR issue. 
# Base Image should be there. 

# if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
# # Settings for NON Pull Request triggers
#   IFS='_' read -ra MAIN_BRANCH <<< "$TRAVIS_BRANCH"
#   BRANCH=$MAIN_BRANCH
# else
# # Settings for Pull Request triggers
#   echo "It is a PR!!"
#   IFS='_' read -ra MAIN_BRANCH <<< "$TRAVIS_PULL_REQUEST_BRANCH"
#   BRANCH=$MAIN_BRANCH
# fi
IFS='_' read -ra BUILD_BRANCH <<< "$TRAVIS_BRANCH"
BRANCH="$(echo $BUILD_BRANCH | tr '[:upper:]' '[:lower:]')"

case "$BRANCH" in
'master')
  echo "Inside master branch"
  export IMAGE_NAME=quarticai/contexalyze_prod;
  export DEFAULT_IMAGE="quarticai/contexalyze_prod:base_latest";
  export ENV="production";
;;
'plat-861')
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