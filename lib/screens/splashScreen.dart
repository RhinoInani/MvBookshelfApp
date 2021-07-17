import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/firebaseReadMethods.dart';
import 'package:mv_bookshelf/backend/userSettings.dart';
import 'package:mv_bookshelf/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool internet = true;
  void initializeFlutterFire() async {
    try {
      await isInternet();
      await Firebase.initializeApp();
      if (internet) {
        setState(() async {
          await readTitles();
          await readPdfUrl();
          await readImageUrl();
          await readUpcoming();
          await readCount();
        });
      }
    } catch (e) {}
  }

  Future<void> isInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        internet = true;
      }
    } on SocketException catch (e) {
      internet = false;
      print(internet);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
    setState(() {
      currentScreen = "Home";
    });
    Timer(new Duration(milliseconds: 1500), () {
      if (internet) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    phone = size.width < 600 ? true : false;
    return Scaffold(
      backgroundColor: internet ? Colors.white : Colors.red,
    );
  }
}
