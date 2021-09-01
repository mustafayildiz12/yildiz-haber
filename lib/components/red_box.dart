
import 'package:flutter/material.dart';
Widget redBox(String param) {
  return Container(
    width: 70,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(0xFFFF0000),
      // borderRadius: BorderRadius.circular(8),
    ),
    child: Text(
      param,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}