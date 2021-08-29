import 'package:flutter/material.dart';

class NamazVakitleri extends StatefulWidget {
  const NamazVakitleri({Key? key}) : super(key: key);

  @override
  _NamazVakitleriState createState() => _NamazVakitleriState();
}

class _NamazVakitleriState extends State<NamazVakitleri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("NAMAZ VAKİTLERİ"),
      ),
    );
  }
}
