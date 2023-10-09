#!/bin/bash

# Lokasi file CI/CD
file_path=".github/workflows/deploy.yml"

# Mengecek apakah file deploy.yml sudah ada
if [ -f "$file_path" ]; then
  echo "File CI/CD (.github/workflows/deploy.yml) sudah ada."
else
  echo "File CI/CD (.github/workflows/deploy.yml) belum ada. Apakah Anda ingin membuatnya? (y/n)"
  read response

  if [ "$response" == "y" ]; then
    # Membuat direktori jika belum ada
    mkdir -p .github/workflows

    # Menulis konfigurasi CI/CD ke dalam file
    echo "name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v2

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: '0.119.0'
        extended: true

    - name: Show Hugo Configuration
      run: cat config/_default/config.toml

    - name: Build
      run: |
        hugo --minify 2>&1 | tee build.log
        if [ \${PIPESTATUS[0]} -ne 0 ]; then
          echo \"::error::Hugo build failed, check build.log for details\"
        fi

    - name: Display Warnings
      run: |
        if [ -f build.log ]; then
          cat build.log | grep \"WARNING\" || true
        fi

    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: \${{ secrets.GIT_TOKEN }}
        publish_dir: ./public

    - name: Setup Environment Variables
      run: |
        echo \"REACT_APP_GITHUB_CLIENT_ID=\${{ secrets.Client_ID }}\" >> \$GITHUB_ENV
        echo \"REACT_APP_GITHUB_CLIENT_SECRET=\${{ secrets.Client_secret }}\" >> \$GITHUB_ENV
" > $file_path

    echo "File CI/CD berhasil dibuat di $file_path"
  else
    echo "Membatalkan operasi."
  fi
fi

