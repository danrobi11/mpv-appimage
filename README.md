# Unofficial mpv AppImage

![MPV Logo](https://mpv.io/images/mpv-logo-128-0baae5aa.png)

This repository provides an **unofficial AppImage** of [mpv v0.39.0](https://github.com/mpv-player/mpv/releases/tag/v0.39.0), a free and open-source media player known for its versatility and performance.

✅ **Perfect for minimalist enthusiasts** – built against **ALSA**, **FFmpeg**, and **OpenGL** for a lightweight, systemd-free experience. **Vulkan is not required.**

## Key Features of mpv v0.39.0

- **New `select.lua` Script**: Easily select files from playlists, tracks, chapters, output devices, and more.
- **Native `autoload.lua` Replacement**: Implemented as `--autocreate-playlist`, improving playlist management.
- **NVIDIA RTX and Intel VSR Scaling Support**: Enables Video Super Resolution scaling with compatible GPUs.
- **Media Controls on Windows**: Improved integration with Windows media controls.
- **Enhanced Track Selection**: Better handling of multi-component languages like `fr-CA`.

For a comprehensive list of changes, refer to the [Release notes](https://github.com/mpv-player/mpv/blob/master/RELEASE_NOTES).

## Build Information

- **mpv Version**: `v0.39.0-1023-gd9dadf07a`  
- **Copyright**: © 2000-2025 mpv/MPlayer/mplayer2 projects  
- **Build Date**: March 13, 2025, 22:06:09  
- This AppImage is built against FUSE 3.x for filesystem support.

### Library Versions

- **libplacebo**: `v7.350.0 (v7.349.0-47-gd9ec2b4b)`  
- **FFmpeg**: `N-118771-g437cbd25e0`

| Library          | Version      |
|------------------|--------------|
| `libavcodec`     | 61.33.102    |
| `libavdevice`    | 61.4.100     |
| `libavfilter`    | 10.9.100     |
| `libavformat`    | 61.9.107     |
| `libavutil`      | 59.59.100    |
| `libswresample`  | 5.4.100      |
| `libswscale`     | 8.13.102     |

*Note: This build incorporates the latest mpv and FFmpeg libraries as of March 13, 2025.*

## Usage

**Download** the AppImage from the [releases section](https://github.com/danrobi11/mpv-appimage/releases).

Make the AppImage executable:

```
chmod +x mpv-x86_64.AppImage
```

Run the AppImage:

```
./mpv-x86_64.AppImage [options] [file|URL|playlist]
```

Example usage:

```
./mpv-x86_64.AppImage /path/to/video.mp4
```

## Notes & Acknowledgments

✅ Minimalist Build: 

Built against ALSA, FFmpeg, and OpenGL for lightweight usage. Vulkan is not required.

This AppImage bundles all necessary dependencies and should run on most Linux distributions, including those based on musl.

Compatibility with AppImageLauncher may vary. Consider using [AM](https://github.com/ivan-hc/AM) instead.

### Acknowledgments

- **mpv**: [Official Repository](https://github.com/mpv-player/mpv)
- **AppImage Build**: Inspired by [pkgforge-dev/mpv-AppImage](https://github.com/pkgforge-dev/mpv-AppImage)

*Disclaimer*:

This is an unofficial build. For official releases and support, please refer to the mpv project.

This repository contains scripts for building the mpv-x86_64.AppImage and the MPV dynamic portable binary.
The scripts was created with assistance from Grok 3, an AI developed by xAI (https://grok.com).
While efforts have been made to ensure the script functions correctly, it is provided "as is" without any warranties
or guarantees of performance, reliability, or compatibility. Users are responsible for testing and verifying the script's output before use.
Neither the repository owner nor xAI is liable for any issues, damages, or data loss that may arise from using this script or the resulting AppImage.
