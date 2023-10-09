#!/bin/bash

# Pesan informasi untuk pengguna
echo "Gunakan skrip ini untuk membangun situs Hugo dan melakukan commit dengan pesan yang mungkin opsional."
echo "Anda dapat memberikan pesan commit opsional sebagai argumen pertama atau biarkan kosong untuk menggunakan pesan default."

# Pesan default untuk commit
commit_message="Rebuild site"

# Cek apakah ada argumen pesan commit
if [ $# -eq 1 ]; then
  commit_message="$1"
fi

# Hapus folder 'public' dan buat ulang
rm -rf public
echo "Folder public sudah dihapus dan dibuat ulang"

# Jalankan Hugo untuk membangun situs dengan opsi minify
hugo --minify

# Tambahkan perubahan ke Git staging area
git add -A

# Lakukan commit dengan pesan yang mungkin telah disediakan
git commit -m "$commit_message"

# Push perubahan ke branch 'main'
git push origin main
