import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/constants.dart';

class TwoSideRoundedButton extends StatelessWidget {
  final String text;
  final double radius;
  final Function press;
  const TwoSideRoundedButton({
    Key key,
    this.text,
    this.radius,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: kBlackColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius))),
        child: Text(
          text,
          style: GoogleFonts.notoSerif(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.015),
        ),
      ),
    );
  }
}
