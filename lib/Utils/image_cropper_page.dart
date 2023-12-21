import 'dart:developer'; // Mengimpor pustaka 'developer' untuk menggunakan fungsi log().

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:uas/Screen/recognization_page.dart'; // Mengimpor pustaka dan file yang dibutuhkan.

Future<String> imageCropperView(String? path, BuildContext context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage( // Memanggil fungsi cropImage() dari pustaka ImageCropper.
    sourcePath: path!, // Menggunakan path dari gambar yang akan di-crop.
    aspectRatioPresets: [ // Menentukan beberapa opsi rasio aspek yang dapat dipilih.
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [ // Menyediakan pengaturan antarmuka (UI) untuk berbagai platform.
      AndroidUiSettings(
          toolbarTitle: 'Crop Image', // Judul toolbar untuk Android.
          toolbarColor: Colors.black, // Warna toolbar untuk Android.
          toolbarWidgetColor: Colors.white, // Warna widget toolbar untuk Android.
          initAspectRatio: CropAspectRatioPreset.original, // Rasio aspek awal untuk Android.
          lockAspectRatio: false), // Mengizinkan perubahan rasio aspek untuk Android.
      IOSUiSettings(
        title: 'Crop Image', // Judul untuk iOS.
      ),
      WebUiSettings(
        context: context, // Konteks untuk pengaturan UI web.
      ),
    ],
  );

  if (croppedFile != null) {
    log("Image cropped"); // Mencatat pesan log jika gambar berhasil di-crop.
    return croppedFile.path; // Mengembalikan path dari gambar yang telah di-crop.
  } else {
    log("Do nothing"); // Mencatat pesan log jika tidak ada gambar yang di-crop.
    return '';
  }
}
