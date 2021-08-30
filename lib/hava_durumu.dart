import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:turkey_news/services/api_service.dart';

import 'model/weather_model.dart';

class HavaDurumu extends StatefulWidget {
  const HavaDurumu({Key? key}) : super(key: key);

  @override
  _HavaDurumuState createState() => _HavaDurumuState();
}

class _HavaDurumuState extends State<HavaDurumu> {
  ApiService hava = ApiService();
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF8AD6F1),
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
              onChanged: (val) {
               setState(() {
                 t1.text = val;
               });
              },
              controller: t1,
              decoration: InputDecoration(
                icon: Icon(Icons.search, color: Colors.black),
                suffixIcon: t1.text.isNotEmpty
                    ? GestureDetector(
                  child: Icon(Icons.close, color: Colors.black),
                  onTap: () {
                    t1.clear();

                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
                    : null,
                hintText:"Arama yapın",
                hintStyle: TextStyle(color: Colors.black54),
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black,
            ),
          ),
          ),

          Expanded(
            child: FutureBuilder(
              future: hava.getWeather(t1.text),
              builder: (BuildContext context, AsyncSnapshot<List<Results>> snapshot) {
                if (snapshot.hasData) {
                  List<Results>? results = snapshot.data;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        childAspectRatio: 1/1.6,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0),
                    shrinkWrap: true,
                    itemCount: results!.length,
                    itemBuilder: (context, index) => havaContainer(
                      results[index].day,
                      results[index].description,
                      results[index].degree + " C",
                      results[index].icon,
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
    ));
  }

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
              style: TextStyle(
                color: Color(0xFF8AD6F1),
                fontSize: 27,
              ),
            ),
            SizedBox(
              height: 5,
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
              style: TextStyle(color: Color(0xFF8AD6F1), fontSize: 22),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              deger,
              style: TextStyle(color: Color(0xFF8AD6F1), fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

/*
SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  havaContainer(
                    "BUGÜN",
                    "Açık",
                    "30/12",
                    Icon(
                      Icons.wb_sunny,
                      size: 36,
                      color: Colors.amberAccent,
                    ),
                  ),
                  havaContainer(
                    "YARIN",
                    "Bulutlu",
                    "24/8",
                    Icon(
                      Icons.cloud,
                      size: 36,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  havaContainer(
                    "ÇARŞAMBA",
                    "Açık",
                    "30/12",
                    Icon(
                      Icons.wb_sunny,
                      size: 36,
                      color: Colors.amberAccent,
                    ),
                  ),
                  havaContainer(
                    "PERŞEMBE",
                    "Yağmurlu",
                    "24/8",
                    Icon(
                      Icons.cloud,
                      size: 36,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
 */
