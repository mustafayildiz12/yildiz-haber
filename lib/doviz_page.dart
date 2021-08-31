import 'package:flutter/material.dart';
import 'package:turkey_news/services/api_service.dart';

import 'model/doviz_model.dart';

class DovizPage extends StatefulWidget {
  const DovizPage({Key? key}) : super(key: key);

  @override
  _DovizPageState createState() => _DovizPageState();
}

class _DovizPageState extends State<DovizPage> {
  ApiService para = ApiService();
  late List<Resultd> results;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("DÖVİZ", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.orange,
        ),
        backgroundColor: Color(0xFF8AD6F1),
        body: FutureBuilder(
          future: para.getMoney(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Resultd>> snapshot) {
            //let's check if we got a response or not
            if (snapshot.hasData) {
              //Now let's make a list of articles
              List<Resultd>? results = snapshot.data;
              return ListView.builder(
                //Now let's create our custom List tile
                itemCount: results!.length,
                itemBuilder: (context, index) =>
                    Text(results[index].name)
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),);
  }

}
