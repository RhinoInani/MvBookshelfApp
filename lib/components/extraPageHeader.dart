import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';

class ExtraPageHeader extends StatelessWidget {
  const ExtraPageHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

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
              TextSpan(text: "Previous "),
              TextSpan(
                  text: "Readings",
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
