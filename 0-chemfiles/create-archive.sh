#!/bin/bash

set -eu

SCRIPT_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)

cd "$SCRIPT_DIR"

# Create archive with only required files
rm -rf bzip2.tar.gz bzip2
mkdir bzip2

cp -r ../{cmake,*.c,*.h,bz_version.h.in} bzip2
cp ../{README.md,COPYING,AUTHORS} bzip2
cp CMakeLists.txt bzip2

tar cf bzip2.tar bzip2/
gzip -9 -f bzip2.tar

echo "created 0-chemfiles/bzip2.tar.gz"
