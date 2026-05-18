# 🐳 Hello Captain Docker

Project sederhana untuk membuat Docker image berbasis Alpine Linux yang aman, ringan, dan efisien.

## Fitur
- **Ringan & Stabil**: Menggunakan base image Alpine 3.22.4 yang memastikan ukuran *image* sangat minimal dan cepat saat di-*pull*.
- **Keamanan (Least Privilege)**: Menerapkan standar keamanan industri dengan menjalankan kontainer menggunakan *non-root user* (`captainuser`).
- **Optimasi Build**: Menggunakan `.dockerignore` untuk mengecualikan file yang tidak diperlukan sehingga proses *build* lebih bersih.
- **Output Instan**: Dikonfigurasi untuk langsung mencetak pesan "Hello, Captain!" ke konsol saat kontainer dijalankan.

## Cara Penggunaan
1. **Build Image**: Buka terminal di root direktori project, lalu buat Docker image dengan perintah:
   ```bash
   docker build -t hello-captain .

2. **Run Container**: Jalankan kontainer yang sudah di-build untuk melihat hasilnya secara instan:
   ```bash
   docker run --rm hello-captain

3. **Advanced Run (Opsional)**: Jika Anda menggunakan versi *advanced*, Anda bisa memasukkan nama Anda sebagai argumen:
   ```bash
   docker run --rm hello-captain NamaAnda