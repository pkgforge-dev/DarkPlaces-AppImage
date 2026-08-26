#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm sdl2-compat
    

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano libdecor-mini

echo "Building DarkPlaces..."
echo "---------------------------------------------------------------"
REPO="https://gitlab.com/xonotic/darkplaces"
VERSION="$(git ls-remote "$REPO" HEAD | cut -c 1-9 | head -1)"
git clone "$REPO" ./darkplaces
echo "$VERSION" > ~/version

mkdir -p ./AppDir/bin
cd ./darkplaces
make release -j$(nproc)
mv -v darkplaces-dedicated darkplaces-sdl ../AppDir/bin
