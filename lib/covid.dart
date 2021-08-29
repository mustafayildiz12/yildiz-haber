import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turkey_news/model/covid_model.dart';
import 'package:turkey_news/services/api_service.dart';

var now = new DateTime.now();
var formatter = new DateFormat('dd.MM.yyyy');
String formattedDate = formatter.format(now);

class CovidVeri extends StatefulWidget {
  const CovidVeri({Key? key}) : super(key: key);

  @override
  _CovidVeriState createState() => _CovidVeriState();
}

class _CovidVeriState extends State<CovidVeri> {
  ApiService client = ApiService();

  //TextEditingController t1 = TextEditingController();

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
        body: FutureBuilder(
          future: client.getCovid(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Result>> snapshot) {
            if (snapshot.hasData) {
              List<Result>? result = snapshot.data;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: result!.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(formattedDate,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              vakaBox(
                                  "BUGÜNKÜ VAKA SAYISI",
                                  result[index].newCases == ""
                                      ? "0"
                                      : result[index].newCases),
                              vakaBox(
                                  "TOPLAM VAKA SAYISI",
                                  result[index].totalCases == ""
                                      ? "0"
                                      : result[index].totalCases)
                            ],
                          ),
                          SizedBox(
                            height: 75.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              vakaBox(
                                  "BUGÜNKÜ VEFAT SAYISI",
                                  result[index].newDeaths == ""
                                      ? "0"
                                      : result[index].newDeaths),
                              vakaBox(
                                  "TOPLAM VEFAT SAYISI",
                                  result[index].totalDeaths == ""
                                      ? "0"
                                      : result[index].totalDeaths)
                            ],
                          ),
                          SizedBox(
                            height: 75.1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              vakaBox(
                                  "AKTİF VAKA SAYISI",
                                  result[index].activeCases == ""
                                      ? "0"
                                      : result[index].activeCases),
                              vakaBox(
                                  "TOPLAM İYİLEŞEN SAYISI",
                                  result[index].totalRecovered == ""
                                      ? "0"
                                      : result[index].totalRecovered)
                            ],
                          ),
                        ],
                      ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget vakaBox(String baslik, String data) {
    return Container(
      width: 145,
      height: 190,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(baslik,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Color(0xFF53ADA1))),
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
            child:
                Text(data, style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
