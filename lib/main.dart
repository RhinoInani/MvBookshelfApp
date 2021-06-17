import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mv_bookshelf/screens/splashScreen.dart';

import 'backend/constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dividerTheme: DividerThemeData(
          color: kBlackColor,
          thickness: 1,
        ),
        textTheme: GoogleFonts.notoSerifTextTheme(Theme.of(context)
            .textTheme
            .apply(displayColor: kBlackColor, bodyColor: kBlackColor)),
      ),
      home: SplashScreen(),
    );
  }
}
