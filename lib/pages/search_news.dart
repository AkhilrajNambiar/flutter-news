import 'package:flutter/material.dart';
import 'package:news_time/common/article_tile.dart';
import 'package:news_time/common/loading.dart';
import 'package:news_time/services/news_api_service.dart';

import '../models/news_article.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {

  final NewsApiService _newsApiService = NewsApiService();

  String _searchQuery = "";

  List<NewsArticle> newsArticles = [];

  void fetchSearchResults() async {
    List<NewsArticle>? articles = await _newsApiService.search(_searchQuery);
    if (articles != null) {
      setState(() {
        newsArticles = articles;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    fetchSearchResults();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.deepOrange
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: newsArticles.length,
                  itemBuilder: (context, index) {
                    NewsArticle article = newsArticles[index];
                    return ArticleTile(article: article);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
