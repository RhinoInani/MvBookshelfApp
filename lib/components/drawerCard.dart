import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/userSettings.dart';

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    Key key,
    @required this.size,
    @required this.text,
    @required this.icon,
    @required this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final Icon icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              fontSize: phone ? size.width * 0.045 : size.width * 0.03,
            ),
          ),
          trailing: icon,
          onTap: press,
        ),
        Divider(
          indent: size.width * 0.03,
          endIndent: size.width * 0.03,
        ),
      ],
    );
  }
}
