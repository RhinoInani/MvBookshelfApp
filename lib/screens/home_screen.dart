import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mv_bookshelf/components/drawerCard.dart';
import 'package:mv_bookshelf/components/weekReading.dart';
import 'package:mv_bookshelf/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
                Divider(
                  indent: size.width * 0.03,
                  endIndent: size.width * 0.03,
                ),
                DrawerCard(
                    size: size,
                    text: "Home",
                    icon: Icon(CupertinoIcons.home),
                    press: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    }),
                DrawerCard(
                    size: size,
                    text: "Previous Readings",
                    icon: Icon(CupertinoIcons.book_fill),
                    press: () {
                      Navigator.of(context).pop();
                    }),
                DrawerCard(
                    size: size,
                    text: "Upcoming Events",
                    icon: Icon(CupertinoIcons.calendar),
                    press: () {
                      Navigator.of(context).pop();
                    }),
                DrawerCard(
                    size: size,
                    text: "Settings",
                    icon: Icon(Icons.settings),
                    press: () {
                      Navigator.of(context).pop();
                    }),
                DrawerCard(
                    size: size,
                    text: "About Us",
                    icon: Icon(CupertinoIcons.info_circle),
                    press: () {
                      Navigator.of(context).pop();
                    }),
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
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              WeekReading(
                size: size,
                week: "Last weeks ",
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
