# Hello Captain Docker

Project sederhana untuk membuat Docker image berbasis Alpine Linux.

## Cara Install

1. **Build Image**
   ```bash
   docker build -t hello-captain .

2. **Run Container**
   ```bash
   docker run hello-captain

3. **Fitur Utama**
   - Base Image: Menggunakan Alpine 3.23.3 yang sangat ringan dan stabil
   - Security: Menerapkan prinsip least privilege dengan menggunakan non-root user (captainuser)
   - Metadata: Dilengkapi dengan label maintainer untuk dokumentasi image
   - Optimasi: Menggunakan .dockerignore untuk proses build yang lebih bersih
   - Output: Mencetak pesan "Hello, Captain!" secara instan ke konsol