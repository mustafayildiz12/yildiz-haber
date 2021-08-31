import 'package:flutter/material.dart';

AppBar mainAppBar(Color color, String title) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    title: Text(title, style: TextStyle(color: Colors.white)),
    backgroundColor: color,
  );
}
