import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';
import 'package:mv_bookshelf/backend/userSettings.dart';
import 'package:mv_bookshelf/components/drawerCard.dart';
import 'package:mv_bookshelf/screens/home_screen.dart';
import 'package:mv_bookshelf/screens/previousReadings.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.8,
      child: Drawer(
        child: Container(
          color: beigeGreen,
          child: ListView(
            children: [
              SizedBox(
                height: widget.size.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.size.height * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MV Bookshelf",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: widget.size.height * 0.03),
                    ),
                    Image.asset(
                      'assets/logo_transparent.png',
                      height: widget.size.height * 0.1,
                    ),
                  ],
                ),
              ),
              Divider(
                indent: widget.size.width * 0.03,
                endIndent: widget.size.width * 0.03,
              ),
              DrawerCard(
                  size: widget.size,
                  text: "Home",
                  icon: Icon(CupertinoIcons.home),
                  press: () {
                    if (currentScreen == "Home") {
                      Navigator.of(context).pop();
                    } else {
                      setState(() {
                        currentScreen = "Home";
                      });
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    }
                  }),
              DrawerCard(
                  size: widget.size,
                  text: "Previous Readings",
                  icon: Icon(CupertinoIcons.book_fill),
                  press: () async {
                    if (currentScreen == "PR") {
                      Navigator.of(context).pop();
                    } else {
                      setState(() {
                        currentScreen = "PR";
                      });
                      // await readAllPdf();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return PreviousReadingsScreen();
                      }));
                    }
                  }),
              DrawerCard(
                  size: widget.size,
                  text: "Upcoming Events",
                  icon: Icon(CupertinoIcons.calendar),
                  press: () {
                    print(DateTime.now().month);
                    Navigator.of(context).pop();
                  }),
              DrawerCard(
                  size: widget.size,
                  text: "Settings",
                  icon: Icon(Icons.settings),
                  press: () {
                    Navigator.of(context).pop();
                  }),
              DrawerCard(
                  size: widget.size,
                  text: "About Us",
                  icon: Icon(CupertinoIcons.info_circle),
                  press: () {
                    Navigator.of(context).pop();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void readAllPdf() async {
    await FirebaseDatabase.instance
        .reference()
        .child('Pdf')
        .limitToLast(previousCounter)
        .onChildAdded
        .listen((event) {
      pdfUrl.add(event.snapshot.value.toString());
    });
  }
}
