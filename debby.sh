#!/bin/bash

# Set the paths
zig_out_dir="./zig-out"
deb_dir="./deb"

# Function to create the deb directory structure
create_deb_directory() {
  # Create the deb directory
  mkdir -p "$deb_dir/DEBIAN"
}

# Function to copy files for aarch64-linux architecture
copy_files_aarch64_linux() {
  local target_dir="$deb_dir/pkghash_aarch64-linux"
  mkdir -p "$target_dir"
  cp "$zig_out_dir/aarch64-linux/pkghash" "$target_dir/pkghash"
}

# Function to copy files for x86_64-linux-gnu architecture
copy_files_x86_64_linux_gnu() {
  local target_dir="$deb_dir/pkghash_x86_64-linux-gnu"
  mkdir -p "$target_dir"
  cp "$zig_out_dir/x86_64-linux-gnu/pkghash" "$target_dir/pkghash"
}

# Function to copy files for x86_64-linux-musl architecture
copy_files_x86_64_linux_musl() {
  local target_dir="$deb_dir/pkghash_x86_64-linux-musl"
  mkdir -p "$target_dir"
  cp "$zig_out_dir/x86_64-linux-musl/pkghash" "$target_dir/pkghash"
}

# Function to create the deb package
create_deb_package() {
  echo "Package: pkghash" > "$deb_dir/DEBIAN/control"
  echo "Version: 0.1" >> "$deb_dir/DEBIAN/control"
  
  # Use "amd64" for x86_64 architecture
  if [ "$1" == "x86_64-linux-gnu" ] || [ "$1" == "x86_64-linux-musl" ]; then
    echo "Architecture: amd64" >> "$deb_dir/DEBIAN/control"
  else
    echo "Architecture: aarch64" >> "$deb_dir/DEBIAN/control"
  fi
  
  echo "Maintainer: Your Name <your.email@example.com>" >> "$deb_dir/DEBIAN/control"
  echo "Description: Your package description" >> "$deb_dir/DEBIAN/control"
  dpkg-deb --build "$deb_dir" "pkghash_$1_0.1.deb"
}

# Create the deb directory structure
create_deb_directory

# Copy files and create deb packages for each architecture
copy_files_aarch64_linux
create_deb_package "aarch64-linux"

copy_files_x86_64_linux_gnu
create_deb_package "x86_64-linux-gnu"

copy_files_x86_64_linux_musl
create_deb_package "x86_64-linux-musl"
