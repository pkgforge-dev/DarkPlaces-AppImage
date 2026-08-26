#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/72x72/apps/darkplaces.png
export DESKTOP=/usr/share/applications/darkplaces-git.desktop
export STARTUPWMCLASS=darkplaces-sdl
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/darkplaces-sdl

# Turn AppDir into AppImage
quick-sharun --make-appimage
