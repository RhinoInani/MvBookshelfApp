import 'package:flutter/material.dart';
import 'package:mv_bookshelf/backend/constants.dart';

BoxDecoration cardBoxDecoration(double radius) {
  return BoxDecoration(
    color: backGrey.withOpacity(0.9),
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      BoxShadow(
        offset: Offset(0, 8),
        blurRadius: 10,
        color: Colors.grey[600],
      ),
    ],
  );
}
