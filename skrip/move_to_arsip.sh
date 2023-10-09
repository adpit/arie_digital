#!/bin/bash

# Pindah ke direktori content dari direktori skrip saat ini
cd ../content

# Fungsi untuk menampilkan daftar direktori
show_dirs() {
  echo "Daftar direktori:"
  find $1 -maxdepth 1 -mindepth 1 -type d
}

# Menu untuk memilih operasi
echo "Pilih operasi yang ingin dilakukan:"
echo "1. Move folder ke arsip"
echo "2. Restore folder dari arsip"
read -p "Pilihan Anda (1/2): " choice

# Cek apakah direktori arsip ada, jika tidak, buat
if [ ! -d "../arsip" ]; then
  echo "Membuat direktori arsip..."
  mkdir ../arsip
fi

# Fungsi untuk memindahkan direktori
move_to_arsip() {
  show_dirs .
  read -p "Pindahkan semua folder? (y/n): " all
  if [ "$all" = "y" ]; then
    echo "Memindahkan semua direktori ke arsip..."
    find . -maxdepth 1 -mindepth 1 -type d -exec mv {} ../arsip/ \;
  else
    target=${1:-devops}
    echo "Memindahkan semua direktori kecuali $target ke direktori arsip..."
    find . -maxdepth 1 -mindepth 1 -type d ! -name "$target" -exec mv {} ../arsip/ \;
  fi
}

# Fungsi untuk memulihkan direktori
restore_from_arsip() {
  show_dirs ../arsip
  read -p "Pulihkan semua folder? (y/n): " all
  if [ "$all" = "y" ]; then
    echo "Memulihkan semua direktori dari arsip..."
    find ../arsip -maxdepth 1 -mindepth 1 -type d -exec mv {} ./ \;
  else
    read -p "Masukkan nama folder yang ingin dipulihkan: " target
    if [ -d "../arsip/$target" ]; then
      echo "Memulihkan folder $target..."
      mv "../arsip/$target" ./
    else
      echo "Folder $target tidak ada di arsip."
    fi
  fi
}

# Eksekusi berdasarkan pilihan
case $choice in
  1)
    read -p "Masukkan nama folder yang ingin dipertahankan (default: devops, kosongkan untuk semua): " target
    move_to_arsip $target
    ;;
  2)
    restore_from_arsip
    ;;
  *)
    echo "Pilihan tidak valid"
    ;;
esac
