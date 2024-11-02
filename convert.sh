#!/usr/bin/env bash

mkdir -p html

for md in markdown/*.md; do
  base=$(basename "$md" .md)
  pandoc --template=html/template.html --metadata title="$base" "$md" -o "html/$base.html"
done