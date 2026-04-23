#!/bin/bash
# Fetch ONNX Runtime 1.20.0 Android prebuilts + headers.
# Run once from external/onnxruntime/ before first oird build that uses ORT.

set -euo pipefail

VERSION="1.20.0"
URL="https://github.com/microsoft/onnxruntime/releases/download/v${VERSION}/onnxruntime-android-${VERSION}.aar"

cd "$(dirname "$0")"
mkdir -p prebuilts/arm64-v8a prebuilts/x86_64 include

if [ ! -f "onnxruntime-android-${VERSION}.aar" ]; then
    echo "[ort-fetch] downloading ${URL}"
    wget -q "${URL}" -O "onnxruntime-android-${VERSION}.aar"
fi

# .aar is just a zip
TMP=$(mktemp -d)
unzip -q "onnxruntime-android-${VERSION}.aar" -d "${TMP}"

cp "${TMP}/jni/arm64-v8a/libonnxruntime.so"  prebuilts/arm64-v8a/
cp "${TMP}/jni/x86_64/libonnxruntime.so"     prebuilts/x86_64/
cp -r "${TMP}/headers/"* include/

rm -rf "${TMP}"

echo "[ort-fetch] done:"
ls -la prebuilts/*/libonnxruntime.so
echo "[ort-fetch] headers:"
ls include/ | head -5
