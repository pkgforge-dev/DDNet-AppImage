<div align="center">

# DDNet AppImage 🐧

[![GitHub Downloads](https://img.shields.io/github/downloads/pkgforge-dev/DDNet-AppImage/total?logo=github&label=GitHub%20Downloads)](https://github.com/pkgforge-dev/DDNet-AppImage/releases/latest)
[![CI Build Status](https://github.com/pkgforge-dev/DDNet-AppImage/actions/workflows/appimage.yml/badge.svg)](https://github.com/pkgforge-dev/DDNet-AppImage/releases/latest)
[![Latest Stable Release](https://img.shields.io/github/v/release/pkgforge-dev/DDNet-AppImage)](https://github.com/pkgforge-dev/DDNet-AppImage/releases/latest)

<p align="center">
  <img src="https://raw.githubusercontent.com/ddnet/ddnet/refs/heads/master/other/icons/DDNet_256x256x32.png" width="128" />
</p>

| Latest Stable Release | Upstream URL |
| :---: | :---: |
| [Click here](https://github.com/pkgforge-dev/DDNet-AppImage/releases/latest) | [Click here](https://github.com/ddnet/ddnet) |

</div>

---

Unofficial AppImage of [DDNet](https://ddnet.org), the cooperative Teeworlds
modification with a focus on racing, built from source with CMake.

AppImage made using [quick-sharun](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh), which makes it extremely easy to turn any binary into a portable package reliably without using containers or similar tricks.

**This AppImage bundles everything and it should work on any Linux distro, including old and musl-based ones.**

This AppImage doesn't require FUSE to run at all, thanks to the [uruntime](https://github.com/VHSgunzo/uruntime).

This AppImage is also supplied with a self-updater by default, so any updates to this application won't be missed, you will be prompted for permission to check for updates and if agreed you will then be notified when a new update is available.

Self-updater is disabled by default if AppImage managers like [am](https://github.com/ivan-hc/AM), [soar](https://github.com/pkgforge/soar) or [dbin](https://github.com/xplshn/dbin) exist, which manage AppImage updates.

## What's inside

Both the client (`DDNet`) and the dedicated server (`DDNet-Server`) are built
from the latest upstream release tag, with video recording (FFmpeg), the OpenGL
and Vulkan backends, and the Rust part of the codebase.

The game data from `/usr/share/ddnet/data` is copied to `$APPDIR/bin/data`,
since DDNet looks for its resources next to the path it was started as.

`DDNet-Tools`, MySQL, UPnP, websockets and Discord are left out, and the
autoupdater is compiled out because this AppImage updates through zsync.

The icon is upstream's own `other/icons/DDNet_256x256x32.png`.

---

More at: [AnyLinux-AppImages](https://pkgforge-dev.github.io/Anylinux-AppImages/)
