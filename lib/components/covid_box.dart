import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget vakaBox(String baslik, String data) {
  return Container(
    width: 145,
    height: 190,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(12)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(baslik,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
        SizedBox(
          height: 25,
        ),
        Container(
          alignment: Alignment.center,
          width: 100,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF0A8477),
            borderRadius: BorderRadius.circular(6),
          ),
          child:
          Text(data, style: TextStyle(fontSize: 18, color: Colors.white)),
        ),
      ],
    ),
  );
}