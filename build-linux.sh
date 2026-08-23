#!/bin/bash

rm -f *.pdf

files=("resume-cn")
echo "Generating..."

for f in "${files[@]}"; do
  {
    echo '#import "main.typ": *;'
    echo '#show: chicv'
  } > "$f.typ"
done

echo '#runReader(Chinese)' >> "resume-cn.typ"
# echo '#runReader(Simplified)' >> "resume.typ"
# echo '#runReader(EnglishFull)' >> "resume-elab.typ"

for f in "${files[@]}"; do
  echo "Building $f.typ"
  typst compile "$f.typ" --font-path ~/.local/share/fonts
  rm "$f.typ"
done
