# 🚀 GitHub Pages Deployment Workflow

Project ini mendemonstrasikan implementasi CI/CD menggunakan GitHub Actions untuk deploy website statis secara otomatis.

## Fitur
- **Otomatisasi**: Deploy otomatis setiap kali ada perubahan pada `index.html`.
- **Path Filtering**: Workflow hanya terpicu jika file spesifik diubah (efisiensi resource).
- **Native Deployment**: Menggunakan teknologi artifact GitHub Pages terbaru.

## Cara Kerja
1. Developer melakukan push perubahan ke branch `main`.
2. GitHub Actions mendeteksi perubahan pada file `index.html`.
3. Workflow melakukan checkout kode, membuat artifact, dan deploy ke GitHub Pages.