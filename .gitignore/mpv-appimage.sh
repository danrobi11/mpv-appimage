#!/bin/bash

# Enable debugging and exit on error
set -ex

# Define directories
BASE_DIR=/home/danrobi/mpv-build
APPDIR=$BASE_DIR/AppDir
BUILD_LIBS_DIR=$BASE_DIR/build_libs
OUTPUT_APPIMAGE=$BASE_DIR/mpv-x86_64.AppImage
LINUXDEPLOY_URL=https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage

# Create necessary directories
mkdir -p "$BUILD_LIBS_DIR" "$APPDIR"

# Install system packages required for building
sudo apt update
sudo apt install -y build-essential git meson ninja-build pkg-config libssl-dev libx11-dev libxext-dev libxpresent-dev libxss-dev libvulkan-dev nasm

# Function to clone or update a Git repository
clone_or_update() {
    local repo_url=$1
    local target_dir=$2
    if [ -d "$target_dir/.git" ]; then
        echo "Updating existing repository in $target_dir..."
        cd "$target_dir"
        git reset --hard
        git pull
        cd ..
    else
        echo "Cloning $repo_url into $target_dir..."
        git clone "$repo_url" "$target_dir"
    fi
}

# Clone or update repositories
clone_or_update https://github.com/libass/libass.git "$BASE_DIR/libass"
clone_or_update https://github.com/FFmpeg/FFmpeg.git "$BASE_DIR/ffmpeg"
clone_or_update https://github.com/haasn/libplacebo.git "$BASE_DIR/libplacebo"
clone_or_update https://github.com/mpv-player/mpv.git "$BASE_DIR/mpv"

# Set PKG_CONFIG_PATH to include custom libraries
export PKG_CONFIG_PATH="$BUILD_LIBS_DIR/lib/pkgconfig:$BUILD_LIBS_DIR/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH"

# Build libass from source
cd "$BASE_DIR/libass"
./autogen.sh
./configure --prefix="$BUILD_LIBS_DIR"
make -j$(nproc)
make install
cd ..

# Build ffmpeg from source with necessary features
cd "$BASE_DIR/ffmpeg"
./configure --prefix="$BUILD_LIBS_DIR" --enable-gpl --enable-libass --enable-openssl --enable-version3
make -j$(nproc)
make install
cd ..

# Build libplacebo from source
cd "$BASE_DIR/libplacebo"
git submodule update --init  # Update submodules to get glad
rm -rf build  # Remove existing build directory if it exists
meson setup build -Dprefix="$BUILD_LIBS_DIR" -Dbuildtype=release
meson compile -C build
meson install -C build
cd ..

# Build MPV from source
cd "$BASE_DIR/mpv"
meson setup build \
    -Dx11=enabled \
    -Dwayland=disabled \
    -Dlibmpv=false \
    -Dvapoursynth=disabled \
    -Dpulse=disabled \
    -Dalsa=enabled \
    -Dbuildtype=release \
    -Dprefix=/usr \
    -Dc_link_args="-L$BUILD_LIBS_DIR/lib -L$BUILD_LIBS_DIR/lib/x86_64-linux-gnu" \
    -Dc_args="-I$BUILD_LIBS_DIR/include"
meson compile -C build
meson install -C build --destdir "$APPDIR"
cd ..

# Create .desktop file for MPV
mkdir -p "$APPDIR/usr/share/applications"
cat > "$APPDIR/usr/share/applications/mpv.desktop" <<EOF
[Desktop Entry]
Name=mpv Media Player
Exec=mpv %U
Icon=mpv
Type=Application
Categories=AudioVideo;Player;Video;
EOF

# Download linuxdeploy
wget -q "$LINUXDEPLOY_URL" -O "$BASE_DIR/linuxdeploy-x86_64.AppImage"
chmod +x "$BASE_DIR/linuxdeploy-x86_64.AppImage"

# Create the AppImage
LD_LIBRARY_PATH="$BUILD_LIBS_DIR/lib:$BUILD_LIBS_DIR/lib/x86_64-linux-gnu" \
"$BASE_DIR/linuxdeploy-x86_64.AppImage" \
    --appdir "$APPDIR" \
    --output appimage \
    --desktop-file "$APPDIR/usr/share/applications/mpv.desktop"

# Rename the output AppImage
mv mpv*.AppImage "$OUTPUT_APPIMAGE"

# Success message
echo "Success! MPV AppImage created at: $OUTPUT_APPIMAGE"
