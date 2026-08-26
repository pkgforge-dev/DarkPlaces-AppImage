#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://gitlab.com/xonotic/darkplaces/-/raw/master/darkplaces72x72.png?ref_type=heads
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/darkplaces-sdl

# Turn AppDir into AppImage
quick-sharun --make-appimage
