# platform_external_onnxruntime — ONNX Runtime fork for JibarOS

JibarOS-maintained fork of [`microsoft/onnxruntime`](https://github.com/microsoft/onnxruntime).

Used by OIR for every non-llama.cpp backend: `vision.detect` (RT-DETR / YOLO-family), `vision.embed` (SigLIP), `vision.ocr` (det+rec pair), `audio.synthesize` (Piper VITS), `audio.vad` (Silero).

## Why fork

- Pinned prebuilt binary (not source build) for integration tractability in v0.x.
- Android `Android.bp` wiring that exports `libonnxruntime.so` to `/system_ext/lib64/` so oird can dlopen it.

## See also

- Upstream: [`microsoft/onnxruntime`](https://github.com/microsoft/onnxruntime)
- JibarOS consumer: [`oird`](https://github.com/jibar-os/oird)

## Migration status

🚧 Transfer/creation in progress.
