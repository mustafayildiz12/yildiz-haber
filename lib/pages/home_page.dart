import 'package:flutter/material.dart';
import 'package:turkey_news/components/custom_list_tile.dart';
import 'package:turkey_news/components/main_app_bar.dart';
import 'package:turkey_news/constants/constants.dart';
import 'package:turkey_news/model/article_model.dart';
import 'package:turkey_news/services/api_service.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  int currentIndex = 0;

  List mansets = [
    "GÜNDEM",
    "SAĞLIK",
    "EKONOMİ",
    "EĞLENCE",
    "BİLİM",
    "SPOR",
    "TEKNOLOJİ"
  ];

  List<Icon> icons = [
    const Icon(
      Icons.bookmark,
    ),
    const Icon(
      Icons.health_and_safety,
      color: Colors.white,
    ),
    const Icon(
      Icons.business_center_sharp,
      color: Colors.white,
    ),
    const Icon(
      Icons.movie_filter_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.science_outlined,
      color: Colors.white,
    ),
    const Icon(
      Icons.fitness_center,
      color: Colors.white,
    ),
    const Icon(
      Icons.title,
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: mainAppBar(first, "SICAK GÜNDEM"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height,
              child: Row(children: [
                Expanded(
                  child: Column(
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Container(
                              width: size.width / 5,
                              height: size.width / 4,
                              decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? const Color(0xFF5DBDBD)
                                      : const Color(0xFFFF6F6F),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  icons[index],
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    mansets[index],
                                    style: TextStyle(
                                        color: currentIndex == index
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: size.height,
                    width: size.width / 1.45,
                    child: currentIndex == 0
                        ? FutureBuilder(
                            future: client.getArticle(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Article>> snapshot) {
                              //let's check if we got a response or not
                              if (snapshot.hasData) {
                                //Now let's make a list of articles
                                List<Article>? articles = snapshot.data;
                                return ListView.builder(
                                  //Now let's create our custom List tile
                                  itemCount: articles!.length,
                                  itemBuilder: (context, index) =>
                                      customListTile(articles[index], context),
                                );
                              }
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          )
                        : currentIndex == 1
                            ? FutureBuilder(
                                future: client.getHealth(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Article>> snapshot) {
                                  //let's check if we got a response or not
                                  if (snapshot.hasData) {
                                    //Now let's make a list of articles
                                    List<Article>? articles = snapshot.data;
                                    return ListView.builder(
                                      //Now let's create our custom List tile
                                      itemCount: articles!.length,
                                      itemBuilder: (context, index) =>
                                          customListTile(
                                              articles[index], context),
                                    );
                                  }
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              )
                            : currentIndex == 2
                                ? FutureBuilder(
                                    future: client.getBusiness(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<Article>> snapshot) {
                                      //let's check if we got a response or not
                                      if (snapshot.hasData) {
                                        //Now let's make a list of articles
                                        List<Article>? articles = snapshot.data;
                                        return ListView.builder(
                                          //Now let's create our custom List tile
                                          itemCount: articles!.length,
                                          itemBuilder: (context, index) =>
                                              customListTile(
                                                  articles[index], context),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  )
                                : currentIndex == 3
                                    ? FutureBuilder(
                                        future: client.getEnt(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<List<Article>>
                                                snapshot) {
                                          //let's check if we got a response or not
                                          if (snapshot.hasData) {
                                            //Now let's make a list of articles
                                            List<Article>? articles =
                                                snapshot.data;
                                            return ListView.builder(
                                              //Now let's create our custom List tile
                                              itemCount: articles!.length,
                                              itemBuilder: (context, index) =>
                                                  customListTile(
                                                      articles[index], context),
                                            );
                                          }
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                      )
                                    : currentIndex == 4
                                        ? FutureBuilder(
                                            future: client.getScience(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<List<Article>>
                                                    snapshot) {
                                              //let's check if we got a response or not
                                              if (snapshot.hasData) {
                                                //Now let's make a list of articles
                                                List<Article>? articles =
                                                    snapshot.data;
                                                return ListView.builder(
                                                  //Now let's create our custom List tile
                                                  itemCount: articles!.length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          customListTile(
                                                              articles[index],
                                                              context),
                                                );
                                              }
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            },
                                          )
                                        : currentIndex == 5
                                            ? FutureBuilder(
                                                future: client.getSport(),
                                                builder: (BuildContext context,
                                                    AsyncSnapshot<List<Article>>
                                                        snapshot) {
                                                  //let's check if we got a response or not
                                                  if (snapshot.hasData) {
                                                    //Now let's make a list of articles
                                                    List<Article>? articles =
                                                        snapshot.data;
                                                    return ListView.builder(
                                                      //Now let's create our custom List tile
                                                      itemCount:
                                                          articles!.length,
                                                      itemBuilder: (context,
                                                              index) =>
                                                          customListTile(
                                                              articles[index],
                                                              context),
                                                    );
                                                  }
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                },
                                              )
                                            : currentIndex == 6
                                                ? FutureBuilder(
                                                    future: client.getTech(),
                                                    builder: (BuildContext
                                                            context,
                                                        AsyncSnapshot<
                                                                List<Article>>
                                                            snapshot) {
                                                      //let's check if we got a response or not
                                                      if (snapshot.hasData) {
                                                        //Now let's make a list of articles
                                                        List<Article>?
                                                            articles =
                                                            snapshot.data;
                                                        return ListView.builder(
                                                          //Now let's create our custom List tile
                                                          itemCount:
                                                              articles!.length,
                                                          itemBuilder: (context,
                                                                  index) =>
                                                              customListTile(
                                                                  articles[
                                                                      index],
                                                                  context),
                                                        );
                                                      }
                                                      return const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      );
                                                    },
                                                  )
                                                : null),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
