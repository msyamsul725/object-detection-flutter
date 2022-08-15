// ignore: implementation_imports
import 'package:camera_platform_interface/src/types/camera_description.dart'
    show CameraDescription;
import 'package:flutter/material.dart';
import 'package:tflite_image_classification/main.dart';
import 'package:tflite_image_classification/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(List<CameraDescription> cameras, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            const Text(
              " Selamat Datang Di Taniite",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                color: Color(0xff2C9D31),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              height: 190,
              child: Image.asset(
                "assets/logo/logo-login.png",
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MainPage(cameras);
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
                    "Lanjut",
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
