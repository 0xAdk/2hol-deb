#!/usr/bin/env sh

: "${THOL_SRC_DIR:=src}"
: "${THOL_CLIENT_BUILD:=$THOL_SRC_DIR/2hol_client_build}"
: "${THOL_BUILD_DIR:="build"}"

if [ -e "$THOL_CLIENT_BUILD/dataVersionNumber.txt" ]; then
	: "${THOL_VERSION:=$(cat "$THOL_CLIENT_BUILD/dataVersionNumber.txt")}"
else
	echo "$THOL_CLIENT_BUILD/dataVersionNumber.txt doesn't exist"
	echo "error: unable to find game version"
	exit 1
fi

cp -r "$THOL_SRC_DIR/root" "$THOL_BUILD_DIR/root"
cp -r "$THOL_CLIENT_BUILD" "$THOL_BUILD_DIR/root/usr/share/2hol"

sed -i "s|%VERSION%|$THOL_VERSION|" "$THOL_BUILD_DIR/root/DEBIAN/control"

# Allow anyone to read and write the game files. While this isn't the best
# solution by any stretch, it is the simplest. Since the way 2hol works is
# by stores cache and user settings in the same directory as the executable.
chmod -R 777 "$THOL_BUILD_DIR/root/usr"

dpkg-deb --build --root-owner-group build/root output
