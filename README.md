# Unofficial mpv v0.39.0 AppImage

This repository provides an **unofficial AppImage** of [mpv v0.39.0](https://github.com/mpv-player/mpv/releases/tag/v0.39.0), a free and open-source media player known for its versatility and performance.

✅ **Perfect for minimalist enthusiasts** – built against **ALSA**, **FFmpeg**, and **OpenGL** for a lightweight, systemd-free experience.

## Key Features of mpv v0.39.0

- **New `select.lua` Script**: Allows users to easily choose files from playlists, tracks, chapters, output devices, and more.
- **Native `autoload.lua` Replacement**: Implemented as `--autocreate-playlist`, enhancing playlist management.
- **NVIDIA RTX and Intel VSR Scaling Support**: Enables Video Super Resolution scaling with compatible GPUs.
- **Media Controls on Windows**: Improved integration with Windows media controls.
- **Enhanced Track Selection**: Better handling of multi-component languages like `fr-CA`.

For a comprehensive list of changes, refer to the [release notes](https://github.com/mpv-player/mpv/blob/master/RELEASE_NOTES).

## Build Information

- **mpv Version**: `v0.39.0-1023-gd9dadf07a`
- **Copyright**: © 2000-2025 mpv/MPlayer/mplayer2 projects
- **Build Date**: March 13, 2025, 22:06:09

### Library Versions

- **libplacebo**: `v7.350.0` (`v7.349.0-47-gd9ec2b4b`)
- **FFmpeg**: `N-118771-g437cbd25e0`

| Library          | Version     |
| ---------------- | ----------- |
| `libavcodec`     | 61.33.102   |
| `libavdevice`    | 61.4.100    |
| `libavfilter`    | 10.9.100    |
| `libavformat`    | 61.9.107    |
| `libavutil`      | 59.59.100   |
| `libswresample`  | 5.4.100     |
| `libswscale`     | 8.13.102    |

*Note: This build incorporates the latest mpv and FFmpeg libraries as of March 13, 2025.*

## Usage

To run the mpv AppImage:

1. **Download** the AppImage from the [releases section](https://github.com/danrobi11/mpv-appimage/releases).

2. **Make it executable**:

```bash
chmod +x mpv-x86_64.AppImage
```

3. **Run the AppImage**:

```bash
./mpv-x86_64.AppImage [options] [file|URL|playlist]
```

For example, to play a video:

```bash
./mpv-x86_64.AppImage /path/to/video.mp4
```

## Notes & Acknowledgments

- **Minimalist Build:** This AppImage is built against **ALSA**, **FFmpeg**, and **OpenGL** for a lightweight setup, avoiding unnecessary dependencies like PulseAudio or PipeWire.
- This AppImage bundles all necessary dependencies and should work on most Linux distributions, including those based on musl.
- Compatibility with AppImageLauncher may vary. As an alternative, consider using [AM](https://github.com/ivan-hc/AM).
- This AppImage functions without `fuse2`, utilizing `fuse3` instead.
- **mpv**: [Official Repository](https://github.com/mpv-player/mpv)
- **AppImage Build**: [pkgforge-dev/mpv-AppImage](https://github.com/pkgforge-dev/mpv-AppImage)

*Disclaimer: This is an unofficial build. For official releases and support, please refer to the [mpv project](https://mpv.io/).*

---

*This README is based on information available as of March 14, 2025.*
