import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget havaContainer(
    String gun, String durum, String deger, String url, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            gun,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF8AD6F1),
              fontSize: 27,
            ),
          ),
          Container(
            width: size.width /4,
            height: size.width /4,
            child: SvgPicture.network(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            durum,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF8AD6F1), fontSize: 22),
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
