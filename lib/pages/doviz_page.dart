import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkey_news/services/api_service.dart';

import '../components/main_app_bar.dart';
import '../model/doviz_model.dart';

class DovizPage extends StatefulWidget {
  const DovizPage({Key? key}) : super(key: key);

  @override
  _DovizPageState createState() => _DovizPageState();
}

class _DovizPageState extends State<DovizPage> {
  ApiService para = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar(Colors.orange, "DÖVİZ"),
        backgroundColor: Color(0xFF8AD6F1),
        body: Column(
          children: [
            Table(
                // border: TableBorder.all(width: 1, color: Colors.purple),
                textDirection: TextDirection.ltr,
                columnWidths: {
                  0: FixedColumnWidth(140),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth()
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Para Birimi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Alış",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Satış",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.normal),
                    ),
                  ]),
                ]),
            FutureBuilder(
              future: para.getMoney(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Result>> snapshot) {
                if (snapshot.hasData) {
                  List<Result>? result = snapshot.data;
                  return ListView.builder(

                      itemCount: result!.length,
                      itemBuilder: (context, index) => Table(
                              textDirection: TextDirection.ltr,
                              columnWidths: {
                                0: FixedColumnWidth(140),
                                1: FlexColumnWidth(),
                                2: FlexColumnWidth()
                              },
                              children: [
                                TableRow(children: [
                                  Text(
                                    result[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF0000),
                                      // borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      result[index].buying,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 70,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF04B14B),
                                      //  borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      result[index].selling,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ]),
                              ]));
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            )
          ],
        ));
  }
}
