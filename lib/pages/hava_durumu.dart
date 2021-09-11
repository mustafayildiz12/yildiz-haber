import 'package:flutter/material.dart';
import 'package:turkey_news/components/main_app_bar.dart';
import 'package:turkey_news/components/weather_box.dart';
import 'package:turkey_news/constants/constants.dart';
import 'package:turkey_news/services/api_service.dart';

import '../model/weather_model.dart';

class HavaDurumu extends StatefulWidget {
  const HavaDurumu({Key? key}) : super(key: key);

  @override
  _HavaDurumuState createState() => _HavaDurumuState();
}

class _HavaDurumuState extends State<HavaDurumu> {
  ApiService hava = ApiService();
  TextEditingController t1 = TextEditingController();
  final key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: mainAppBar(third, "HAVA DURUMU"),
            backgroundColor: Color(0xFF8AD6F1),
            body: Column(
              children: [
                Form(
                  key: key,
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      //border: Border.all(color: Colors.black26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      controller: t1,
                      autofocus: false,
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
                        hintText: "Şehir adı",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (val) {
                        setState(() {
                          TextSelection previousSelection = t1.selection;
                          t1.text = val;
                          t1.selection = previousSelection;
                        });
                      },
                    ),
                  ),
                ),
                t1.text.isEmpty
                    ? Text("Bilgi almak istediğiniz şehir ismini giriniz")
                    : Expanded(
                        child: FutureBuilder(
                          future: hava.getWeather(
                              "&data.city=${t1.text.toLowerCase()}"),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Results>> snapshot) {
                            if (snapshot.hasData) {
                              List<Results>? results = snapshot.data;
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 250,
                                        childAspectRatio: 1 / 1.6,
                                        crossAxisSpacing: 0,
                                        mainAxisSpacing: 0),
                                shrinkWrap: true,
                                itemCount: results!.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: ()=> print("$index"),
                                  child: havaContainer(
                                    results[index].day,
                                    results[index].description,
                                    results[index].degree + " C",
                                    results[index].icon,
                                  ),
                                ),
                              );
                            }

                            return const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
              ],
            )));
  }
}
