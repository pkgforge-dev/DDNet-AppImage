#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm --needed \
	base-devel        \
	cmake             \
	curl              \
	ffmpeg            \
	freetype2         \
	git               \
	glew              \
	libnotify         \
	libogg            \
	libpng            \
	openssl           \
	opus              \
	opusfile          \
	python            \
	rust              \
	sdl2              \
	sqlite            \
	strace            \
	vulkan-headers    \
	vulkan-icd-loader \
	wavpack           \
	xorg-server-xvfb  \
	zlib

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Building DDNet..."
echo "---------------------------------------------------------------"
git clone https://github.com/ddnet/ddnet ./ddnet
cd ./ddnet

if [ "${DEVEL_RELEASE-}" = 1 ]; then
	git rev-parse --short HEAD > ~/version
else
	git fetch --tags origin
	# release tags are plain numeric, everything else in there is not one
	TAG=$(git tag | grep -E '^[0-9]+(\.[0-9]+)+$' | sort -V | tail -1)
	git checkout "$TAG"
	echo "$TAG" > ~/version
fi

cmake -S . -B build                 \
	-DCMAKE_BUILD_TYPE=Release  \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DTOOLS=OFF                 \
	-DMYSQL=OFF                 \
	-DUPNP=OFF                  \
	-DWEBSOCKETS=OFF            \
	-DDISCORD=OFF               \
	-DAUTOUPDATE=OFF            \
	-DVIDEORECORDER=ON
cmake --build build -j"$(nproc)"
cmake --install build
