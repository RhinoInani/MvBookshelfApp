import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/screens/home_screen.dart';

import '../firebaseReturn.dart';

//todo: check connections, using connectivity package or some sort

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() async {
        _initialized = true;
        // twrPdfUrl = await FirebaseStorage.instance
        //     .ref('/week0/2021_AP_Physics_1_Exam_FRQ.pdf')
        //     .getDownloadURL();
        // twrImageUrl = await FirebaseStorage.instance
        //     .ref('/week0/background2.JPG')
        //     .getDownloadURL();
        // lwrImageUrl = twrImageUrl;
        // twrTitle = await FirebaseDatabase.instance
        //     .reference()
        //     .child('Titles')
        //     .child('Week1')
        //     .once()
        //     .then((data) {
        //   print(data.value);
        //   return data.value;
        // });

        await _readTitles();

        await _readPdfUrl();

        await _readImageUrl();

        await _readAuthor();
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  void _readTitles() async {
    int counterTitles = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Titles')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterTitles == 0) {
        lwrTitle = event.snapshot.value.toString();
        counterTitles++;
      } else {
        twrTitle = event.snapshot.value.toString();
      }
    });
  }

  void _readPdfUrl() async {
    int counterPdf = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Pdf')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterPdf == 0) {
        lwrPdfUrl = event.snapshot.value.toString();
        counterPdf++;
      } else {
        twrPdfUrl = event.snapshot.value.toString();
      }
    });
  }

  void _readImageUrl() async {
    int counterImage = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Image')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterImage == 0) {
        lwrImageUrl = event.snapshot.value.toString();
        counterImage++;
      } else {
        twrImageUrl = event.snapshot.value.toString();
      }
    });
  }

  void _readAuthor() async {
    int counterAuthor = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Author')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterAuthor == 0) {
        lwrAuthor = event.snapshot.value.toString();
        counterAuthor++;
      } else {
        twrAuthor = event.snapshot.value.toString();
      }
    });
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    Timer(new Duration(milliseconds: 1500), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
