import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mv_bookshelf/backend/constants.dart';
import 'package:mv_bookshelf/components/cardBoxDecoration.dart';

class UpcomingCard extends StatelessWidget {
  const UpcomingCard({
    Key key,
    @required this.size,
    @required this.date,
    @required this.title,
    @required this.home,
  }) : super(key: key);

  final Size size;
  final DateTime date;
  final String title;
  final bool home;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        home
            ? Padding(
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
              )
            : SizedBox(
                height: size.height * 0.04,
              ),
        Center(
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.8,
            decoration: cardBoxDecoration(29),
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
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.1,
                          child: AutoSizeText(
                            "${DateFormat('d').format(date)}",
                            softWrap: true,
                            wrapWords: false,
                            style: TextStyle(
                              fontSize: size.height * 0.09,
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
                        "$title",
                        softWrap: true,
                        wrapWords: false,
                        maxLines: 4,
                        style: TextStyle(
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
