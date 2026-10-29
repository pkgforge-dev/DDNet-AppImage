#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=./ddnet.png
export DESKTOP=./ddnet.desktop
export DEPLOY_OPENGL=1
export DEPLOY_VULKAN=1
export DEPLOY_DATADIR=0

# Deploy dependencies
quick-sharun /usr/bin/DDNet /usr/bin/DDNet-Server

# DDNet finds its data next to the binary it was started as, so it has to be
# in $APPDIR/bin/data for the game to locate its resources
cp -rv /usr/share/ddnet/data ./AppDir/bin/

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
