#!/bin/bash

rm -rf public
echo "folder public sudah di hapus dan dibuat ulang"	

hugo --minify

git add -A

git commit -m "Rebuild site"

git push origin main
