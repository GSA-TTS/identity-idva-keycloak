#!/bin/bash -e

keycloak_version=$(cat KEYCLOAK_VERSION)
jdk_version=$(cat JDK_VERSION)
keycloak_download_url="https://github.com/keycloak/keycloak/releases/download/$keycloak_version"
jdk_download_url="https://github.com/adoptium/temurin11-binaries/releases/download/jdk-$jdk_version"

keycloak_archive_name="keycloak-$keycloak_version.tar.gz"

jdk_archive_name="OpenJDK11U-jdk_x64_linux_hotspot_${jdk_version/+/_}.tar.gz"

keycloak_archive_url="$keycloak_download_url/$keycloak_archive_name"
jdk_archive_url="$jdk_download_url/$jdk_archive_name"

# Download archive
wget --quiet "$keycloak_archive_url"
wget --quiet "$jdk_archive_url"

# Extract and clean up
tar -xzf "$keycloak_archive_name"
tar -xzf "$jdk_archive_name"
rm "$keycloak_archive_name"
rm "$jdk_archive_name"
