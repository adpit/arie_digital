#!/bin/bash

if [ -d "public" ]; then
  rm -rf public
fi

hugo --minify

git add .

git commit -m "Rebuild site"

git push origin main
