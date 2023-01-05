import 'package:flutter/material.dart';
import 'package:news_time/common/article_tile.dart';
import 'package:news_time/common/loading.dart';
import 'package:news_time/services/news_api_service.dart';

import '../models/breaking_news_list.dart';
import '../models/news_article.dart';
import 'search_news.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {

  final NewsApiService newsApi = NewsApiService();

  List<NewsArticle> articles = [];

  bool _isLoading = false;

  void _getBreakingNews() async {
    BreakingNewsList? breakingNews = await newsApi.getBreakingNewsForCountry("in");
    if (breakingNews != null) {
      setState(() {
        articles = breakingNews.articles;
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    _getBreakingNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Loading() : Scaffold(
      appBar: AppBar(
        title: Text("Breaking News"),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              icon: Icon(Icons.search, color: Colors.white,)
          )
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            NewsArticle item = articles[index];
            return ArticleTile(article: item);
          },
        ),
      ),
    );
  }
}
