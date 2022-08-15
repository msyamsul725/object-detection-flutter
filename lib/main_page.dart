import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/klasifikasi_gambar.dart';

import 'objek_deteksi_gambar.dart';

class MainPage extends StatelessWidget {
  final List<CameraDescription> cameras;

  // ignore: use_key_in_widget_constructors
  const MainPage(this.cameras);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: RichText(
          text: const TextSpan(
            text: "Hai, ",
            style: TextStyle(
              fontSize: 18,
            ),
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              TextSpan(
                text: "Sahabat Tani",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xff81C784),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.asset(
                "assets/logo/menu.png",
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const TfliteModel();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff2C9D31),
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Klasifikasi Gambar",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ObjectDetection(cameras);
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff2C9D31),
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Deteksi Realtime",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
