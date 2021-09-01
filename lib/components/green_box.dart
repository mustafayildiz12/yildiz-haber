import 'package:flutter/material.dart';

Widget greenBox(String param) {
  return Container(
    width: 70,
    height: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color(0xFF04B14B),
      //  borderRadius: BorderRadius.circular(8),
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