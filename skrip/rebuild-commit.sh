#!/bin/bash

cd ../

# Pesan informasi untuk pengguna
echo "Gunakan skrip ini untuk membangun situs Hugo dan melakukan commit dengan pesan yang mungkin opsional."

# Pesan default untuk commit
commit_message="Rebuild site"

# Beri waktu 10 detik untuk pengguna memasukkan pesan commit
echo "Silakan masukkan pesan commit dalam 10 detik (jika dibiarkan kosong, pesan default akan digunakan):"
read -t 10 user_commit_message

# Jika pengguna memasukkan pesan, gunakan itu. Jika tidak, gunakan pesan default.
if [ ! -z "$user_commit_message" ]; then
  commit_message="$user_commit_message"
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
