import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';
import 'package:mv_bookshelf/components/cardBoxDecoration.dart';
import 'package:mv_bookshelf/components/drawerCard.dart';
import 'package:mv_bookshelf/components/weekReading.dart';
import 'package:mv_bookshelf/constants.dart';
import 'package:mv_bookshelf/userSettings.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refresh() async {
    await readTitles();

    await readPdfUrl();

    await readImageUrl();

    await readUpcoming();
  }

  void readTitles() async {
    int counterTitles = 0;
    String tempReturn;
    await FirebaseDatabase.instance
        .reference()
        .child('Titles')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterTitles == 0) {
        setState(() {
          tempReturn = event.snapshot.value.toString();
          lwrTitle = tempReturn.substring(0, tempReturn.indexOf(","));
          lwrAuthor = tempReturn.substring(tempReturn.indexOf(",") + 1);
          counterTitles++;
        });
      } else {
        setState(() {
          tempReturn = event.snapshot.value.toString();
          twrTitle = tempReturn.substring(0, tempReturn.indexOf(","));
          twrAuthor = tempReturn.substring(tempReturn.indexOf(",") + 1);
        });
      }
    });
  }

  void readPdfUrl() async {
    int counterPdf = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Pdf')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterPdf == 0) {
        setState(() {
          lwrPdfUrl = event.snapshot.value.toString();
          counterPdf++;
        });
      } else {
        setState(() {
          twrPdfUrl = event.snapshot.value.toString();
        });
      }
    });
  }

  void readImageUrl() async {
    int counterImage = 0;
    await FirebaseDatabase.instance
        .reference()
        .child('Image')
        .limitToLast(2)
        .onChildAdded
        .listen((event) {
      if (counterImage == 0) {
        setState(() {
          lwrImageUrl = event.snapshot.value.toString();
          counterImage++;
        });
      } else {
        setState(() {
          twrImageUrl = event.snapshot.value.toString();
        });
      }
    });
  }

  void readUpcoming() async {
    String upcomingEvents;
    await FirebaseDatabase.instance
        .reference()
        .child('Upcoming')
        .limitToLast(1)
        .onChildAdded
        .listen((event) {
      setState(() {
        upcomingEvents = event.snapshot.value.toString();
        upMonth =
            int.parse(upcomingEvents.substring(0, upcomingEvents.indexOf("/")));
        upDay = int.parse(upcomingEvents.substring(
            upcomingEvents.indexOf("/") + 1, upcomingEvents.indexOf(",")));
        upEvent = upcomingEvents.substring(upcomingEvents.indexOf(",") + 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Size size = MediaQuery.of(context).size;

    DateTime date = DateTime(DateTime.now().year, upMonth, upDay);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Container(
        width: size.width * 0.8,
        child: Drawer(
          child: Container(
            color: beigeGreen,
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
                      if (currentScreen == "Home") {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      }
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
                      print(DateTime.now().month);
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
        child: RefreshIndicator(
          onRefresh: () {
            return _refresh();
          },
          color: Color.fromRGBO(110, 120, 107, 0.85),
          child: ListView(
            padding: EdgeInsets.zero,
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
                          textStyle: phone
                              ? Theme.of(context).textTheme.headline3
                              : Theme.of(context).textTheme.headline2),
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
                height: size.height * 0.04,
              ),
              WeekReading(
                size: size,
                week: "Last weeks ",
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.03),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: size.height * 0.03, color: kBlackColor),
                          children: [
                            TextSpan(
                              text: "Upcoming ",
                            ),
                            TextSpan(
                                text: "events...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    ),
                  ),
                  Center(
                      child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.8,
                    decoration: cardBoxDecoration(),
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.025,
                          left: size.width * 0.05,
                          child: Container(
                            height: size.height * 0.15,
                            width: size.height * 0.15,
                            decoration: BoxDecoration(
                                color: beigeGreen.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(26),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 8),
                                    blurRadius: 10,
                                    color: Colors.grey[400],
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: AutoSizeText(
                                    "${DateFormat('MMMM').format(date)}",
                                    softWrap: true,
                                    wrapWords: false,
                                    style: TextStyle(
                                      fontSize: size.width * 0.045,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: AutoSizeText(
                                    "${DateFormat('d').format(date)}",
                                    softWrap: true,
                                    wrapWords: false,
                                    style: TextStyle(
                                      fontSize: size.width * 0.17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned.fill(
                            right: size.width * 0.1,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: size.width * 0.25,
                                  child: AutoSizeText(
                                    "$upEvent",
                                    softWrap: true,
                                    wrapWords: false,
                                    style: TextStyle(
                                        fontSize: size.width * 0.1,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )))
                      ],
                    ),
                  )),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
