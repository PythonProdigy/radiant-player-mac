#!/usr/bin/env bash

if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "master" ]]; then
  echo "Testing on a branch other than master. No deployment will be done."
  exit 0
fi

RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
OUTPUTDIR="$PWD/build/Release-iphoneos"

mkdir -p $OUTPUTDIR

LATEST_ARCHIVE_PATH=`find ~/Library/Developer/Xcode/Archives -type d -Btime -60m -name '*.xcarchive' | head -1`
echo $LATEST_ARCHIVE_PATH

PRODUCT_PATH="$LATEST_ARCHIVE_PATH/Products/Applications/$APPNAME.app"
DSYM_PATH="$LATEST_ARCHIVE_PATH/dSYMs/$APPNAME.app.dSYM"
echo $PRODUCT_PATH
echo $DSYM_PATH
