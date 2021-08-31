import 'package:flutter/material.dart';

Widget namazBox(String vakit, String saat) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            vakit,
            style: TextStyle(
                color: Color(0xFFC97B7B),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFC97B7B),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(saat,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}