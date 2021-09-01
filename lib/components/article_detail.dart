import 'package:flutter/material.dart';

Widget detailBox(String name) {
  return Container(
    padding: const EdgeInsets.all(6.0),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(30.0),
    ),
    child: Text(
      name,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
Widget ImageContainer(String path) {
  return Container(
    height: 200.0,
    width: double.infinity,
    decoration: BoxDecoration(
      //let's add the height

      image: DecorationImage(
          image: NetworkImage(path), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}