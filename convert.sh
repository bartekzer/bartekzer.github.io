#!/usr/bin/env bash

mkdir -p article

for md in markdown/*.md; do
  base=$(basename "$md" .md)
  creation_date=$(stat -c %w "$md" | awk '{print $1, $2}')
  modification_date=$(stat -c %y "$md" | awk '{print $1, $2}')
  
  if [ "$creation_date" == "-" ]; then
    creation_date=$modification_date
  fi

  formatted_creation_date=$(date -d "$creation_date" +"%A, %B %d, %Y at %H:%M")
  formatted_modification_date=$(date -d "$modification_date" +"%A, %B %d, %Y at %H:%M")

  title=$(echo "$base" | sed 's/-/ /g' | awk '{print toupper(substr($1,1,1)) tolower(substr($1,2)) " " substr($0, index($0,$2))}')

  pandoc --template=article/template.html --metadata title="$title." --metadata date="$formatted_creation_date" --metadata mod_date="$formatted_modification_date" "$md" -o "article/$base.html"
done