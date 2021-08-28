import 'package:flutter/material.dart';

class CovidVeri extends StatefulWidget {
  const CovidVeri({Key? key}) : super(key: key);

  @override
  _CovidVeriState createState() => _CovidVeriState();
}

class _CovidVeriState extends State<CovidVeri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF53ADA1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("COVİD-19 VERİLERİ",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("28.08.2021",
                    style: TextStyle(fontSize: 25, color: Colors.white))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 145,
                height: 210,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BUGÜNKÜ TEST SAYISI",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
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
                      child: Text("20.000",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 145,
                height: 210,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BUGÜNKÜ VAKA SAYISI",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
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
                      child: Text("12.567",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 75.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 145,
                height: 210,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BUGÜNKÜ VEFAT SAYISI",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
                    SizedBox(
                      height: 29,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF0A8477),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text("256",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              Container(
                width: 145,
                height: 210,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("BUGÜNKÜ İYİLEŞEN SAYISI",
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
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
                      child: Text("6.789",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
