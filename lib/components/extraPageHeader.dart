import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';

class ExtraPageHeader extends StatelessWidget {
  const ExtraPageHeader({
    Key key,
    @required this.size,
    @required this.text,
    @required this.boldText,
  }) : super(key: key);

  final Size size;
  final String text;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: size.width * 0.08,
              color: kBlackColor,
            ),
            children: [
              TextSpan(text: "$text "),
              TextSpan(
                  text: "$boldText",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
        Divider(
          color: kBlackColor,
          thickness: 1.5,
          indent: size.width * 0.3,
          endIndent: size.width * 0.3,
        ),
      ],
    );
  }
}
