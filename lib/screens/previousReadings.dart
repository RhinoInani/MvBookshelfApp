import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/backend/firebaseReadMethods.dart';
import 'package:mv_bookshelf/backend/firebaseReturn.dart';
import 'package:mv_bookshelf/components/cardBoxDecoration.dart';
import 'package:mv_bookshelf/components/extraPageHeader.dart';
import 'package:mv_bookshelf/components/sideMenu.dart';
import 'package:mv_bookshelf/components/weekReading.dart';

class PreviousReadingsScreen extends StatefulWidget {
  const PreviousReadingsScreen({Key key}) : super(key: key);

  @override
  _PreviousReadingsScreenState createState() => _PreviousReadingsScreenState();
}

class _PreviousReadingsScreenState extends State<PreviousReadingsScreen> {
  @override
  Widget build(BuildContext context) {
    int itemCount = previousCounter + 1;

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
          itemCount: itemCount,
          itemBuilder: (context, index) {
            int counter = index;
            if (index == 0) {
              index++;
              return Column(
                children: [
                  ExtraPageHeader(
                    size: size,
                    text: "Previous",
                    boldText: "Readings",
                  ),
                  WeekReading(
                    size: size,
                    week: "This weeks ",
                    home: false,
                    imageUrl: imageUrl.elementAt(counter),
                    pdfUrl: pdfUrl.elementAt(counter),
                    title: title.elementAt(counter),
                    author: author.elementAt(counter),
                  ),
                ],
              );
            } else if (index == itemCount - 1) {
              index++;
              return Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.05,
                      decoration: cardBoxDecoration(100),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            previousCounter += 5;
                            readAll();
                          });
                        },
                        child: Center(
                          child: Text(
                            "Load more",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (author.elementAt(counter) == "test" ||
                author.elementAt(counter) == null) {
              return Container();
            } else {
              return WeekReading(
                size: size,
                week: "This weeks ",
                home: false,
                imageUrl: imageUrl.elementAt(counter),
                pdfUrl: pdfUrl.elementAt(counter),
                title: title.elementAt(counter),
                author: author.elementAt(counter),
              );
            }
          }),
    );
  }
}
