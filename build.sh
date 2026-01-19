#!/bin/bash
rm -f duke3d.xdc
# js-dos v8 - threadless version (no SharedArrayBuffer needed)
zip -r duke3d.xdc \
  icon.png \
  vector.png \
  index.html \
  manifest.toml \
  js-dos.js \
  js-dos.css \
  duke3d.jsdos \
  emulators

echo ""
echo "Built duke3d.xdc"
ls -lh duke3d.xdc
