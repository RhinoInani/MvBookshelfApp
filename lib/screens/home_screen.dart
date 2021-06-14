import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mv_bookshelf/components/weekReading.dart';
import 'package:mv_bookshelf/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool _initialized = false;
  // bool _error = false;
  //
  // void initializeFlutterFire() async {
  //   try {
  //     await Firebase.initializeApp();
  //     setState(() async {
  //       _initialized = true;
  //       pdfUrl = await FirebaseStorage.instance
  //           .ref('/week0/2021_AP_Physics_1_Exam_FRQ.pdf')
  //           .getDownloadURL();
  //       readingImageUrl = await FirebaseStorage.instance
  //           .ref('/week0/background2.JPG')
  //           .getDownloadURL();
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _error = true;
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   initializeFlutterFire();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Container(
        width: size.width * 0.8,
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(110, 120, 107, 0.85),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "MV Bookshelf + logo",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: size.height * 0.04),
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
                ListTile(
                  title: Text(
                    "Previous Readings",
                    style: TextStyle(
                      //todo: fix sizing with phone boolean
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  trailing: Icon(CupertinoIcons.book_fill),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kBlackColor),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/greenBG.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: size.height * .09,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.notoSerif(
                          textStyle: Theme.of(context).textTheme.headline3),
                      children: [
                        TextSpan(text: "Mv "),
                        TextSpan(
                            text: "Bookshelf",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: kBlackColor,
                thickness: 1.5,
                indent: size.width * 0.3,
                endIndent: size.width * 0.3,
              ),
              WeekReading(
                size: size,
                week: "This weeks ",
                weekBold: "reading",
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              WeekReading(
                size: size,
                week: "Last weeks ",
                weekBold: "reading",
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.03),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: size.height * 0.03, color: kBlackColor),
                          children: [
                            TextSpan(
                              text: "Continue ",
                            ),
                            TextSpan(
                                text: "reading...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
