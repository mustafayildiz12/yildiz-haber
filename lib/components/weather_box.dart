import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget havaContainer(String gun, String durum, String deger, String url) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            gun,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8AD6F1),
              fontSize: 27,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 130,
            height: 120,
            child: SvgPicture.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            durum,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF8AD6F1), fontSize: 22),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            deger,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFF8AD6F1),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  );
}