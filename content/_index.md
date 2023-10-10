+++
title = "Halaman Depan banget!"
archetype = "home"
description = "Ini adalah halaman depan situs saya."
+++

## Alur Kerja DevOps

### Continuous Integration/Continuous Deployment (CI/CD)

Kami menggunakan GitHub Actions untuk memastikan bahwa setiap perubahan diuji dan diterapkan secara otomatis. Berikut ini adalah langkah-langkah dalam pipeline CI/CD kami:

1. **Checkout**: Mengambil versi terbaru dari kode sumber.
2. **Setup Hugo**: Menginstal versi Hugo yang diperlukan.
3. **Show Hugo Configuration**: Menampilkan konfigurasi Hugo untuk debug.
4. **Build**: Membangun situs dengan Hugo. Jika terjadi kegagalan, akan tampil pesan error.
5. **Display Warnings**: Menampilkan peringatan, jika ada.
6. **Deploy**: Menerapkan perubahan ke halaman GitHub.
7. **Setup Environment Variables**: Menetapkan variabel lingkungan yang diperlukan.

Pipeline ini akan otomatis dijalankan setiap kali ada perubahan di `branch` main.

### Skrip Manajemen Situs

- `add_konten.sh`: Menambahkan konten baru ke situs.
- `check_ci_cd.sh`: Memeriksa status CI/CD.
- `move_to_arsip.sh`: Memindahkan konten lama ke arsip.
- `rebuild.sh`: Membangun ulang situs.
- `setup-theme-relearn.sh`: Mengatur tema untuk situs.

Setiap skrip ini mempermudah manajemen situs dan memastikan bahwa semua proses berjalan lancar.

# Cara Pakai Git pada Praktek

Anda ingin merestorasi (mengembalikan) repo Anda ke kondisi 4 jam yang lalu. Anda telah mencari dan menemukan commit ID yang spesifik (`e92746dcbadf870ee6449f02f7347751b8c9a3e8`) untuk digunakan sebagai titik restorasi.

## Langkah-langkah untuk Merestorasi Repo Anda ke Commit ID Spesifik

### Pastikan Berada di Branch yang Tepat

Anda harus berada di branch yang ingin Anda modifikasi. Misalnya, jika Anda ingin merubah branch `main`, pastikan Anda berada di situ.

```bash
git checkout main
```

### Membuat Branch Sementara (Opsional)

Sebagai tindakan pencegahan, Anda bisa membuat branch baru sebagai tempat penyimpanan sementara.

```bash
git checkout -b backup-branch
```

### Merestorasi ke Commit ID Tertentu

```bash
git reset --hard e92746dcbadf870ee64XXXX
```

⚠️ **Perhatian**: `git reset --hard` akan menghapus semua commit dan perubahan setelah commit ID yang Anda tentukan. Pastikan Anda mem-backup perubahan terbaru Anda sebelum menjalankan perintah ini.

### Push Keberatan ke Remote Repository

```bash
git push origin main --force
```

⚠️ **Perhatian**: `--force` akan memaksa perubahan di remote repository, berhati-hatilah saat menggunakan opsi ini terutama pada proyek bersama.

---

## Langkah-langkah Lanjutan

### Verifikasi Perubahan

Anda bisa menggunakan perintah `git log` untuk memastikan bahwa HEAD sekarang berada pada commit yang diinginkan.

```bash
git log
```

### Jaga Branch Cadangan

Jika Anda membuat branch cadangan (`backup-branch`), pertimbangkan untuk membiarkannya tetap ada sebagai backup. Anda juga bisa push branch ini ke remote repository.

```bash
git push origin backup-branch
```

### Sinkronisasi dengan Tim

Jika ini adalah proyek bersama, pastikan untuk memberi tahu tim Anda tentang perubahan ini, karena operasi ini berdampak pada history.

### Periksa CI/CD

Jika Anda menggunakan pipeline CI/CD, pastikan untuk memeriksa apakah semua proses masih berjalan dengan lancar setelah merestorasi repo.


### NOTE
- subl -> View -> identation -> convert identation to space/tab 
jika ada error
```python
  File "/Users/admin/Desktop/devops/konvert/convertany.py", line 36
    elif para == "Autosimpan & Feedback Loop":
```           
