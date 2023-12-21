import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uas/Screen/recognization_page.dart';
import 'package:uas/Utils/image_cropper_page.dart';
import 'package:uas/Utils/image_picker_class.dart';
import 'package:uas/Widgets/modal_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scambd'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style: TextStyle(
          color: Colors.white, // Mengubah warna teks menjadi putih
        ),
        ),
        backgroundColor: Colors.black, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo1.png'),
            SizedBox(height: 20), // Anda bisa mengubah ini sesuai kebutuhan
            Text('Import an image to be converted'),
            SizedBox(height: 20), // Anda bisa mengubah ini sesuai kebutuhan
            FloatingActionButton.extended(
              onPressed: () {
                log("Camera");
                pickImage(source: ImageSource.camera).then((value) {
                  if (value != '') {
                    imageCropperView(value, context).then((value) {
                      if (value != '') {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => RecognizePage(
                              path: value,
                            ),
                          ),
                        );
                      }
                    });
                  }
                });
              },
              tooltip: 'Camera',
              label: Text(
                "Camera",
                style: TextStyle(
                  color: Colors.white, // Mengubah warna teks menjadi putih
                ),
              ),
              backgroundColor: Colors.black, // Mengubah warna tombol menjadi coklat
            ),

            SizedBox(height: 20), // Anda bisa mengubah ini sesuai kebutuhan
            FloatingActionButton.extended(
              onPressed: () {
                log("Gallery");
                pickImage(source: ImageSource.gallery).then((value) {
                  if (value != '') {
                    imageCropperView(value, context).then((value) {
                      if (value != '') {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => RecognizePage(
                              path: value,
                            ),
                          ),
                        );
                      }
                    });
                  }
                });
              },
              tooltip: 'Gallery',
              label: const Text(
                "Gallery",
                style: TextStyle(
                    color: Colors.white, // Mengubah warna teks menjadi putih
                  ),
                ),
              backgroundColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

}
