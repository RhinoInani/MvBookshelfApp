import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/backend/firebaseReadMethods.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';
import 'package:mv_bookshelf/backend/userSettings.dart';
import 'package:mv_bookshelf/components/sideMenu.dart';
import 'package:mv_bookshelf/components/upcomingCard.dart';
import 'package:mv_bookshelf/components/weekReading.dart';

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
    setState(() {
      twrAuthor;
      twrTitle;
      twrPdfUrl;
      twrImageUrl;
      lwrAuthor;
      lwrTitle;
      lwrPdfUrl;
      lwrImageUrl;
      upMonth;
      upDay;
      upYear;
      upEvent;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Size size = MediaQuery.of(context).size;

    DateTime date = DateTime(upYear, upMonth, upDay);

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SideMenu(size: size),
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
                home: true,
                imageUrl: twrImageUrl,
                pdfUrl: twrPdfUrl,
                title: twrTitle,
                author: twrAuthor,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              WeekReading(
                size: size,
                week: "Last weeks ",
                home: true,
                imageUrl: lwrImageUrl,
                pdfUrl: lwrPdfUrl,
                title: lwrTitle,
                author: lwrAuthor,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              UpcomingCard(
                size: size,
                date: date,
                title: upEvent,
                home: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
