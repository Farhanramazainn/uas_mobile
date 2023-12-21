import 'dart:developer'; // Mengimpor pustaka 'developer' untuk menggunakan fungsi log().

import 'package:image_picker/image_picker.dart'; // Mengimpor pustaka yang diperlukan untuk mengambil gambar.

Future<String> pickImage({ImageSource? source}) async {
  final picker = ImagePicker(); // Membuat instance dari ImagePicker untuk mengambil gambar.

  String path = ''; // Mendefinisikan variabel string kosong untuk menyimpan path dari gambar yang akan diambil.

  try {
    final getImage = await picker.pickImage(source: source!); // Meminta pengguna untuk memilih atau mengambil gambar dari source yang ditentukan.

    if (getImage != null) {
      path = getImage.path; // Jika gambar berhasil dipilih, simpan path gambar tersebut.
    } else {
      path = ''; // Jika tidak ada gambar yang dipilih, atur path menjadi string kosong.
    }
  } catch (e) {
    log(e.toString()); // Menangkap dan mencatat pesan kesalahan jika terjadi kesalahan dalam proses pemilihan gambar.
  }

  return path; // Mengembalikan path dari gambar yang dipilih, atau string kosong jika tidak ada gambar yang dipilih.
}
