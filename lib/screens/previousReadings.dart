import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/components/extraPageHeader.dart';
import 'package:mv_bookshelf/components/sideMenu.dart';
import 'package:mv_bookshelf/components/weekReading.dart';

class PreviousReadingsScreen extends StatelessWidget {
  const PreviousReadingsScreen({Key key}) : super(key: key);

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
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ExtraPageHeader(
                size: size,
              );
            }
            return WeekReading(
              size: size,
              week: "This weeks ",
              home: false,
            );
          }),
    );
  }
}
