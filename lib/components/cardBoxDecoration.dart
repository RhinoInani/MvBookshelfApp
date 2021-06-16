import 'package:flutter/material.dart';

BoxDecoration cardBoxDecoration() {
  return BoxDecoration(
    color: Color.fromRGBO(229, 224, 215, 0.9),
    borderRadius: BorderRadius.circular(29),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 8),
        blurRadius: 10,
        color: Colors.grey[400],
      ),
    ],
  );
}
