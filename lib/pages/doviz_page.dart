import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkey_news/constants/constants.dart';
import 'package:turkey_news/services/doviz_api.dart';
import '../components/main_app_bar.dart';
import '../model/doviz_model.dart';

class DovizPage extends StatefulWidget {
  const DovizPage({Key? key}) : super(key: key);

  @override
  _DovizPageState createState() => _DovizPageState();
}

class _DovizPageState extends State<DovizPage> {
  DovizApi api = DovizApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: mainAppBar(fifth, "DÖVİZ"),
        backgroundColor: Color(0xFF8AD6F1),
        body: Column(
          children: [
            Table(
                border: TableBorder.all(width: 0.1, color: Colors.white),
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
            Expanded(
              child: FutureBuilder(
                future: api.getMoney(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Result>> snapshot) {
                  if (snapshot.hasData) {
                    List<Result>? result = snapshot.data;
                    return ListView.builder(
                        itemCount: result!.length,
                        itemBuilder: (context, index) => Table(
                                border: TableBorder.all(
                                    width: 0.1, color: Colors.white),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    redBox("${result[index].selling}"),
                                    greenBox("${result[index].buying}")
                                  ]),
                                ]));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )
          ],
        ));
  }

  Widget redBox(String param) {
    return Container(
      width: 70,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFFF0000),
        // borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        param,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget greenBox(String param) {
    return Container(
      width: 70,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF04B14B),
        //  borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        param,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
