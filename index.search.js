var relearn_search_index=[{breadcrumb:"",content:"",description:"",tags:null,title:"berita",uri:"/berita/index.html"},{breadcrumb:"Linux",content:"",description:"",tags:null,title:"Centos",uri:"/linux/centos/index.html"},{breadcrumb:"",content:`ini adalah page untuk Linux, di edit dari github
`,description:"",tags:null,title:"Linux",uri:"/linux/index.html"},{breadcrumb:"berita",content:"",description:"",tags:null,title:"olahraga",uri:"/berita/olahraga/index.html"},{breadcrumb:"Linux",content:"",description:"",tags:null,title:"REDHEAT",uri:"/linux/redheat/index.html"},{breadcrumb:"Windows",content:"",description:"",tags:null,title:"W10",uri:"/windows/w10/index.html"},{breadcrumb:"",content:"",description:"",tags:null,title:"Windows",uri:"/windows/index.html"},{breadcrumb:"",content:"",description:"",tags:null,title:"Categories",uri:"/categories/index.html"},{breadcrumb:"",content:`Alur Kerja DevOps Continuous Integration/Continuous Deployment (CI/CD) Kami menggunakan GitHub Actions untuk memastikan bahwa setiap perubahan diuji dan diterapkan secara otomatis. Berikut ini adalah langkah-langkah dalam pipeline CI/CD kami:
Checkout: Mengambil versi terbaru dari kode sumber. Setup Hugo: Menginstal versi Hugo yang diperlukan. Show Hugo Configuration: Menampilkan konfigurasi Hugo untuk debug. Build: Membangun situs dengan Hugo. Jika terjadi kegagalan, akan tampil pesan error. Display Warnings: Menampilkan peringatan, jika ada. Deploy: Menerapkan perubahan ke halaman GitHub. Setup Environment Variables: Menetapkan variabel lingkungan yang diperlukan. Pipeline ini akan otomatis dijalankan setiap kali ada perubahan di branch main.
Skrip Manajemen Situs add_konten.sh: Menambahkan konten baru ke situs. check_ci_cd.sh: Memeriksa status CI/CD. move_to_arsip.sh: Memindahkan konten lama ke arsip. rebuild.sh: Membangun ulang situs. setup-theme-relearn.sh: Mengatur tema untuk situs. Setiap skrip ini mempermudah manajemen situs dan memastikan bahwa semua proses berjalan lancar.
Cara Pakai Git pada Praktek Anda ingin merestorasi (mengembalikan) repo Anda ke kondisi 4 jam yang lalu. Anda telah mencari dan menemukan commit ID yang spesifik (e92746dcbadf870ee6449f02f7347751b8c9a3e8) untuk digunakan sebagai titik restorasi.
Langkah-langkah untuk Merestorasi Repo Anda ke Commit ID Spesifik Pastikan Berada di Branch yang Tepat Anda harus berada di branch yang ingin Anda modifikasi. Misalnya, jika Anda ingin merubah branch main, pastikan Anda berada di situ.
git checkout mainMembuat Branch Sementara (Opsional) Sebagai tindakan pencegahan, Anda bisa membuat branch baru sebagai tempat penyimpanan sementara.
git checkout -b backup-branchMerestorasi ke Commit ID Tertentu git reset --hard e92746dcbadf870ee64XXXX⚠️ Perhatian: git reset --hard akan menghapus semua commit dan perubahan setelah commit ID yang Anda tentukan. Pastikan Anda mem-backup perubahan terbaru Anda sebelum menjalankan perintah ini.
Push Keberatan ke Remote Repository git push origin main --force⚠️ Perhatian: --force akan memaksa perubahan di remote repository, berhati-hatilah saat menggunakan opsi ini terutama pada proyek bersama.
Langkah-langkah Lanjutan Verifikasi Perubahan Anda bisa menggunakan perintah git log untuk memastikan bahwa HEAD sekarang berada pada commit yang diinginkan.
git logJaga Branch Cadangan Jika Anda membuat branch cadangan (backup-branch), pertimbangkan untuk membiarkannya tetap ada sebagai backup. Anda juga bisa push branch ini ke remote repository.
git push origin backup-branchSinkronisasi dengan Tim Jika ini adalah proyek bersama, pastikan untuk memberi tahu tim Anda tentang perubahan ini, karena operasi ini berdampak pada history.
Periksa CI/CD Jika Anda menggunakan pipeline CI/CD, pastikan untuk memeriksa apakah semua proses masih berjalan dengan lancar setelah merestorasi repo.
NOTE subl -> View -> identation -> convert identation to space/tab jika ada error File "/Users/admin/Desktop/devops/konvert/convertany.py", line 36 elif para == "Autosimpan & Feedback Loop":`,description:"Ini adalah halaman depan situs saya.",tags:null,title:"Halaman Depan banget!",uri:"/index.html"},{breadcrumb:"",content:"",description:"",tags:null,title:"Tags",uri:"/tags/index.html"}]