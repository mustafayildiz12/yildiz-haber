import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkey_news/services/api_service.dart';

import 'model/namaz_model.dart';

class NamazVakitleri extends StatefulWidget {
  const NamazVakitleri({Key? key}) : super(key: key);

  @override
  _NamazVakitleriState createState() => _NamazVakitleriState();
}

class _NamazVakitleriState extends State<NamazVakitleri> {
  ApiService namaz = ApiService();
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC97B7B),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("NAMAZ VAKİTLERİ",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 42,
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.black26),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(

              controller: t1,
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.black),

                      suffixIcon: t1.text.isNotEmpty
                          ? GestureDetector(
                        child: Icon(Icons.close, color: Colors.black),
                        onTap: () {
                          t1.clear();
                          FocusScope.of(context)
                              .requestFocus(FocusNode());
                        },
                      )
                          : null,

                hintText: "Arama yapın",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (val) {
                setState(() {
                  t1.text = val;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: namaz.getNamaz("?data.city=${t1.text}"),
              builder: (BuildContext context, AsyncSnapshot<List<Resultn>> snapshot) {
                if (snapshot.hasData) {
                  List<Resultn>? results = snapshot.data;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 1 / 1.6,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    shrinkWrap: true,
                    itemCount: results!.length,
                    itemBuilder: (context, index) => namazBox(
                      results[index].vakit,
                      results[index].saat,
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      )
    );
  }

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
}
