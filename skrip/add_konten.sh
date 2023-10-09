#!/bin/bash

# Pindah ke direktori content dari direktori skrip saat ini
cd ../content

# Cek apakah direktori saat ini adalah 'content'
current_dir=$(basename "$PWD")
if [ "$current_dir" != "content" ]; then
  echo "Script harus dijalankan dari direktori 'content'."
  exit 1
fi

# Fungsi untuk membuat topik baru
create_topic() {
  echo "Topik yang ada:"
  ls -d */
  read -p "Pilih topik atau buat baru: " topic_name
  topic_path="./$topic_name"

  # Cek jika topik sudah ada
  if [ -d "$topic_path" ]; then
    echo "Topik $topic_name sudah ada. Tambahkan konten? (y/n)"
    read add_content
    if [ "$add_content" == "y" ]; then
      create_content "$topic_name"
    fi
  else
    mkdir -p "$topic_path"
    # Tanda awal ```TOML
    echo "
\`\`\`TOML
+++
title = \"$topic_name\"
weight = 1
+++
\`\`\`
" > "$topic_path/_index.md"
    # Tanda akhir ```
    echo "Topik $topic_name berhasil dibuat."
  fi
}

# Fungsi untuk membuat konten baru
create_content() {
  topic=$1
  read -p "Masukkan nama konten baru: " content_name
  content_path="$topic/$content_name"

  # Buat direktori dan file _index.md di dalamnya
  mkdir -p "$content_path"
  # Tanda awal ```TOML
  echo "
\`\`\`TOML
+++
title = \"$content_name\"
weight = 1
+++
\`\`\`
" > "$content_path/_index.md"
  # Tanda akhir ```
  echo "Konten $content_name berhasil dibuat di topik $topic."

cd ../

# Hapus folder 'public' dan buat ulang
rm -rf public
echo "Folder public sudah dihapus dan dibuat ulang"

# Jalankan Hugo untuk membangun situs dengan opsi minify
hugo --minify

# Tambahkan perubahan ke Git staging area
git add -A

# Lakukan commit dengan pesan yang mungkin telah disediakan
git commit -m "Add Konten $content_name di topik $topic."

# Push perubahan ke branch 'main'
git push origin main
}

echo "Apa yang ingin Anda lakukan?"
echo "1. Buat atau pilih topik"
echo "2. Buat konten baru dalam topik yang ada"
read -p "Pilihan Anda (1/2): " choice

case $choice in
  1)
    create_topic
    ;;
  2)
    read -p "Masukkan nama topik tempat konten akan disimpan: " topic_name
    create_content "$topic_name"
    ;;
  *)
    echo "Pilihan tidak valid."
    ;;
esac
