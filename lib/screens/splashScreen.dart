import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/firebaseReadMethods.dart';
import 'package:mv_bookshelf/screens/home_screen.dart';
import 'package:mv_bookshelf/userSettings.dart';

//todo: check connections, using connectivity package or some sort

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() async {
        await readTitles();

        await readPdfUrl();

        await readImageUrl();

        await readAuthor();

        await readUpcoming();
      });
    } catch (e) {
      setState(() {});
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    setState(() {
      currentScreen = "Home";
    });
    Timer(new Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    phone = size.width < 600 ? true : false;
    return Scaffold();
  }
}
