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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF8AD6F1),
      body: FutureBuilder(
        future: hava.getWeather(),
        builder: (BuildContext context, AsyncSnapshot<List<Results>> snapshot) {
          if (snapshot.hasData) {
            List<Results>? results = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: results!.length,
              itemBuilder: (context, index) => Column(
                children: [
                  havaContainer(
                    results[index].day,
                    results[index].description,
                    results[index].degree +" C",
                    results[index].icon,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }

  Widget havaContainer(String gun, String durum, String deger, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Container(
        width: 320,
        height: 450,
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
                fontSize: 38,
              ),
            ),
            SizedBox(
              height: 25,
            ),
           Container(
             width: 140,
             height: 135,
             child: SvgPicture.network(url,fit: BoxFit.cover,),
           ),
            SizedBox(
              height: 25,
            ),
            Text(
              durum,
              style: TextStyle(
                color: Color(0xFF8AD6F1),
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              deger,
              style: TextStyle(
                color: Color(0xFF8AD6F1),
                fontSize: 24,
              ),
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
