import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';
import 'package:mv_bookshelf/components/extraPageHeader.dart';
import 'package:mv_bookshelf/components/sideMenu.dart';
import 'package:mv_bookshelf/components/upcomingCard.dart';

class UpcomingEventsScreen extends StatefulWidget {
  const UpcomingEventsScreen({Key key}) : super(key: key);

  @override
  _UpcomingEventsScreenState createState() => _UpcomingEventsScreenState();
}

class _UpcomingEventsScreenState extends State<UpcomingEventsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: SideMenu(
        size: size,
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: kBlackColor),
        elevation: 0,
      ),
      backgroundColor: beigeGreen,
      body: ListView.builder(
          itemCount: upcomingCounter,
          itemBuilder: (BuildContext context, index) {
            if (index == 0) {
              index++;
              return Column(
                children: [
                  ExtraPageHeader(
                    size: size,
                    text: "Upcoming",
                    boldText: "Events",
                  ),
                  UpcomingCard(
                    size: size,
                    date: allUpcomingDates.elementAt(index),
                    title: allUpcomingEvents.elementAt(index),
                  ),
                ],
              );
            }
            if (allUpcomingEvents.elementAt(index) == "test") {
              return Container();
            } else {
              return UpcomingCard(
                size: size,
                date: allUpcomingDates.elementAt(index),
                title: allUpcomingEvents.elementAt(index),
              );
            }
          }),
    );
  }
}
