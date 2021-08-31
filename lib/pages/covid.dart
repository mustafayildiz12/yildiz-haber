import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turkey_news/components/covid_box.dart';
import 'package:turkey_news/components/main_app_bar.dart';
import 'package:turkey_news/constants/constants.dart';
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
        appBar: mainAppBar(second, "COVİD 19 VERİLERİ"),
        body: FutureBuilder(
          future: client.getCovid(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Resultc>> snapshot) {
            if (snapshot.hasData) {
              List<Resultc>? result = snapshot.data;
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
                                horizontal: 4, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Text(
                                  formattedDate,
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 5),
                            child: Text(
                              "Günlük veriler akşam saatlerinde güncellenmektedir !!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
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
                            height: 45,
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
                            height: 45,
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


}
