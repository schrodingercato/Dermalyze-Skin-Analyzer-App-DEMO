# 🩺 Dermalyze AI - Skin Analysis App

**Dermalyze AI** adalah aplikasi berbasis Flutter yang dirancang untuk analisis kesehatan kulit secara digital dengan antarmuka (UI/UX) premium dan modern. Proyek ini dikembangkan sebagai bagian dari tugas **Eksplorasi Mandiri 05** oleh mahasiswi **Teknologi Kedokteran ITS**.

---

## ✨ Fitur Utama

### 1. 📸 Scanning Mode (Capture Interface)
- Antarmuka pemindaian wajah dengan *Medical Overlay* yang estetik.
- Bingkai pemindaian *rounded square* dengan indikator sudut berwarna ungu.
- Tombol shutter shutter yang responsif dengan animasi loading saat proses analisis.

### 2. 📊 Analysis Result Dashboard
- **Diagnosis Komprehensif**: Menampilkan *Skin Age*, *Skin Health Score*, *Undertone*, dan *Skin Shade*.
- **Indikator Kesehatan (Grid View)**: Visualisasi 4 parameter (Dryness, Spots, Acne, Moisture) menggunakan *Circular Progress Indicator*.
- **Rekomendasi Bahan Aktif**: Edukasi mengenai kandungan yang dibutuhkan kulit (seperti Ceramides, Hyaluronic Acid, dll) dalam bentuk kartu horizontal yang elegan.

### 3. 🛍️ Rekomendasi Produk & Female Daily Integration
- Daftar produk skincare pilihan (Skintific, Somethinc, dll).
- Informasi detail mencakup: Merk, Nama Produk, Kandungan Bahan Aktif, dan Harga (Rp).
- **Link Langsung**: Setiap produk dapat diklik dan akan mengarah langsung ke halaman review di **Female Daily**.

### 4. 🧭 Navigasi & UI/UX Premium
- **Multi-Page Navigation**: Menggunakan *Bottom Navigation Bar* fungsional (Home, Search, Favorite, Profile).
- **Tema Warna**: *Soft Purple* (#6C63FF) sebagai warna primer, memberikan kesan medis namun tetap modern dan bersih.
- **Modular Widget**: Kode terstruktur dengan komponen yang dipisahkan agar mudah dipelihara.

---

## 🛠️ Spesifikasi Teknis

- **Framework**: Flutter
- **Bahasa**: Dart
- **State Management**: Simple `setState` (Simulasi Proses AI)
- **Library**: `url_launcher` (untuk navigasi ke browser eksternal)
- **Aset**: Network Images (Unsplash/Pexels)

---

## 🚀 Cara Menjalankan Proyek

1. Pastikan Anda sudah menginstal Flutter SDK di komputer Anda.
2. Clone repositori ini:
   ```bash
   git clone https://github.com/username/dermalyze-ai.git
   ```
3. Masuk ke direktori proyek:
   ```bash
   cd dermalyze-ai
   ```
4. Instal dependensi:
   ```bash
   flutter pub get
   ```
5. Jalankan aplikasi:
   ```bash
   flutter run
   ```

---

## 📝 Dokumentasi Tugas

Proyek ini telah memenuhi persyaratan laporan praktikum dengan menyertakan komentar penjelasan (*commentary*) pada setiap blok kode penting seperti:
- `Widget Text`
- `Widget Image`
- `Widget ListView`
- `Widget GridView`

---

## 👩‍🔬 Disusun Oleh

**Aisyah Rahmi Nadjib**  
Mahasiswi Teknologi Kedokteran  
**Institut Teknologi Sepuluh Nopember (ITS)**

---

*Aplikasi ini dikembangkan untuk tujuan edukasi dan simulasi teknologi medis.*
