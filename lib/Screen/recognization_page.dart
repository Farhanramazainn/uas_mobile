import 'dart:developer'; // Mengimpor pustaka 'developer' untuk menggunakan fungsi log().
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class RecognizePage extends StatefulWidget {
  final String? path;
  const RecognizePage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizePage> createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  bool _isBusy = false; // Boolean untuk menandai apakah aplikasi sedang melakukan proses.

  TextEditingController controller = TextEditingController(); // Controller untuk TextFormField.

  @override
  void initState() { // Fungsi dipanggil saat widget dibuat.
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!); // Mengambil path gambar dari widget dan membuat InputImage.

    processImage(inputImage); // Memulai proses pengenalan teks dari gambar.
  }

  @override
  Widget build(BuildContext context) { // Membangun UI.
    return Scaffold(
        appBar: AppBar(title: const Text("recognized page")),
        body: _isBusy == true // Cek kondisi jika sedang sibuk.
            ? const Center(
                child: CircularProgressIndicator(),
              ) // Tampilkan indikator jika sedang sibuk.
            : Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  maxLines: MediaQuery.of(context).size.height.toInt(),
                  controller: controller,
                  decoration:
                      const InputDecoration(hintText: "Text goes here..."),
                ),
              ));
  }

  void processImage(InputImage image) async { // Fungsi untuk memproses gambar.
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin); // Membuat instance TextRecognizer.

    setState(() {
      _isBusy = true; // Set state untuk menunjukkan aplikasi sedang sibuk.
    });

    log(image.filePath!); // Mencetak path dari gambar yang sedang diproses.

    final RecognizedText recognizedText = await textRecognizer.processImage(image); // Memproses teks dari gambar.

    controller.text = recognizedText.text; // Menampilkan teks yang dikenali pada TextFormField.

    ///End busy state
    setState(() {
      _isBusy = false; // Set state kembali setelah selesai proses.
    });
  }
}
