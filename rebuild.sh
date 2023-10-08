#!/bin/bash

if [ -d "public" ]; then
  rm -rf public
  echo "folder public sudah di hapus dan dibuat ulang"	
fi

hugo --minify

git add .

git commit -m "Rebuild site"

git push origin main
