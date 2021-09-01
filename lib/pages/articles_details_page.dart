import 'package:flutter/material.dart';
import 'package:turkey_news/components/article_detail.dart';
import 'package:turkey_news/constants/constants.dart';
import 'package:turkey_news/model/article_model.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title,style: const TextStyle(color: Colors.white)),
        backgroundColor: first,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageContainer(article.urlToImage),
            const SizedBox(
              height: 8.0,
            ),
            detailBox(article.source.name),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.description,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }

}
