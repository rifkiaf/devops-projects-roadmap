#!/bin/bash

# --- 1. Cek argumen ---
if [ $# -ne 1 ]; then
  echo "Usage: ./log-archive.sh <log-directory>"
  exit 1
fi

LOG_DIR="$1"

# --- 2. Cek direktori log ---
if [ ! -d "$LOG_DIR" ]; then
  echo "Error: Direktori '$LOG_DIR' tidak ditemukan."
  exit 1
fi

# --- 3. Direktori project & arsip ---
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
ARCHIVE_DIR="$PROJECT_DIR/archives"
mkdir -p "$ARCHIVE_DIR"

# --- 4. Direktori ekstrak ---
EXTRACT_DIR="$PROJECT_DIR/test-extract"
mkdir -p "$EXTRACT_DIR"

# --- 5. Timestamp & nama arsip ---
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# --- 6. File catatan arsip ---
ARCHIVE_LOG="$ARCHIVE_DIR/archive.log"

# --- 7. Kompres isi folder log ---
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# --- 8. Cek hasil ---
if [ $? -eq 0 ]; then
  echo "[$(date +"%Y-%m-%d %H:%M:%S")] Arsip dibuat: $ARCHIVE_NAME" >> "$ARCHIVE_LOG"
  echo "✅ Arsip berhasil dibuat:"
  echo "   $ARCHIVE_PATH"
else
  echo "❌ Gagal mengarsipkan log."
  exit 1
fi

# --- 9. Ekstrak arsip terbaru ke folder unik ---
DEST_DIR="$EXTRACT_DIR/${ARCHIVE_NAME%.tar.gz}"
mkdir -p "$DEST_DIR"
tar -xzf "$ARCHIVE_PATH" -C "$DEST_DIR"
echo "✅ Arsip diekstrak di: $DEST_DIR"
