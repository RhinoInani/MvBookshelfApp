import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';

BoxDecoration cardBoxDecoration() {
  return BoxDecoration(
    color: backGrey.withOpacity(0.9),
    borderRadius: BorderRadius.circular(29),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 8),
        blurRadius: 10,
        color: Colors.grey[500],
      ),
    ],
  );
}
