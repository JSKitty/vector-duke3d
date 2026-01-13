#!/bin/bash
rm -f duke3d.xdc
# js-dos v7 - wasm files are in root, not emulators subfolder
zip -r duke3d.xdc \
  icon.png \
  vector.png \
  index.html \
  manifest.toml \
  js-dos.js \
  js-dos.css \
  duke3d.jsdos \
  wdosbox.js \
  wdosbox.wasm

echo ""
echo "Built duke3d.xdc"
ls -lh duke3d.xdc
