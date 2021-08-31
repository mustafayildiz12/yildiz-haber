import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turkey_news/components/main_app_bar.dart';
import 'package:turkey_news/components/pray_box.dart';
import 'package:turkey_news/services/api_service.dart';

import '../constants/constants.dart';
import '../model/namaz_model.dart';

class NamazVakitleri extends StatefulWidget {
  const NamazVakitleri({Key? key}) : super(key: key);

  @override
  _NamazVakitleriState createState() => _NamazVakitleriState();
}

class _NamazVakitleriState extends State<NamazVakitleri> {
  ApiService namaz = ApiService();
  TextEditingController t1 = TextEditingController();
  final key = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFC97B7B),
        appBar: mainAppBar(fourth, "NAMAZ VAKİTLERİ"),
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
                 // border: Border.all(color: Colors.black26.withOpacity(0.4)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextField(
                  controller: t1,
                  autofocus: false,
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
                ? Center(
                    child: Text("Bilgi almak istediğiniz şehir ismini giriniz"))
                : Expanded(
                    child: FutureBuilder(
                      future: namaz.getNamaz("?data.city=${t1.text}"),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Resultn>> snapshot) {
                        if (snapshot.hasData) {
                          List<Resultn>? results = snapshot.data;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
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
        ));
  }

}
