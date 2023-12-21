import 'package:flutter/material.dart'; // Mengimpor pustaka Flutter untuk membuat UI.

void imagePickerModal(BuildContext context, {VoidCallback? onCameraTap, VoidCallback? onGalleryTap}) {
  showModalBottomSheet( // Memunculkan modal bottom sheet.
      context: context, // Menggunakan konteks dari parameter.
      builder: (context) { // Membangun tampilan bottom sheet.
        return Container(
          padding: const EdgeInsets.all(20), // Padding untuk konten.
          height: 220, // Tinggi dari bottom sheet.
          child: Column(
            children: [
              GestureDetector( // Widget untuk mendeteksi ketika tombol ditekan.
                onTap: onCameraTap, // Aksi ketika tombol kamera ditekan.
                child: Card( // Kartu untuk menampilkan pilihan kamera.
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15), // Padding untuk teks.
                    decoration: const BoxDecoration(color: Colors.grey), // Warna latar belakang.
                    child: const Text("Camera", // Teks yang ditampilkan.
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)), // Gaya teks.
                  ),
                ),
              ),
              const SizedBox(height: 10), // Spacer antara dua opsi.
              GestureDetector( // Widget untuk mendeteksi ketika tombol ditekan.
                onTap: onGalleryTap, // Aksi ketika tombol galeri ditekan.
                child: Card( // Kartu untuk menampilkan pilihan galeri.
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(15), // Padding untuk teks.
                    decoration: const BoxDecoration(color: Colors.grey), // Warna latar belakang.
                    child: const Text("Gallery", // Teks yang ditampilkan.
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)), // Gaya teks.
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
