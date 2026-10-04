#!/bin/bash
# Rebuild after editing EscapeOrb.metal: bash ios/metal/build_metallib.sh
set -euo pipefail
cd "$(dirname "$0")"
for sdk in iphoneos iphonesimulator; do
  xcrun -sdk "$sdk" metal -c EscapeOrb.metal -o "/tmp/EscapeOrb-$sdk.air"
  xcrun -sdk "$sdk" metallib "/tmp/EscapeOrb-$sdk.air" -o "../Resources/Metal/EscapeOrb-$sdk.metallib"
done
echo "metallibs rebuilt"
