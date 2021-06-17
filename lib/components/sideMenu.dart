import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';
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
              Text(
                "MV Bookshelf + logo",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: widget.size.height * 0.03),
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
                  press: () {
                    if (currentScreen == "PR") {
                      Navigator.of(context).pop();
                    } else {
                      setState(() {
                        currentScreen = "PR";
                      });
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
}
