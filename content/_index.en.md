+++
title = "Halaman Depan"
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

### NOTE
- subl -> View -> identation -> convert identation to space/tab 
jika ada error
```python
  File "/Users/admin/Desktop/devops/konvert/convertany.py", line 36
    elif para == "Autosimpan & Feedback Loop":
```           
