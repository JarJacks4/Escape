#!/bin/bash
# Rebuild after editing a .metal file: bash ios/metal/build_metallib.sh
set -euo pipefail
cd "$(dirname "$0")"
for shader in EscapeOrb MoodOrb; do
  for sdk in iphoneos iphonesimulator; do
    xcrun -sdk "$sdk" metal -c "$shader.metal" -o "/tmp/$shader-$sdk.air"
    xcrun -sdk "$sdk" metallib "/tmp/$shader-$sdk.air" -o "../Resources/Metal/$shader-$sdk.metallib"
  done
done
echo "metallibs rebuilt"
