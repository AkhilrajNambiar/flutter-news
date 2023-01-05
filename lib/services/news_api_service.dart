import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_time/models/news_article.dart';

import '../models/breaking_news_list.dart';

class NewsApiService {

  final String _baseUrl = "https://newsapi.org/v2/";
  final Map<String, String> _headers = {
    "Authorization": "77ea46eec6ab4761b277b1a6fde795a3"
  };


  Future<BreakingNewsList?> getBreakingNewsForCountry(String country) async {
    Response response = await get(
      Uri.parse("${_baseUrl}top-headlines?country=$country"),
      headers: _headers
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<NewsArticle> topHeadlines = [];
      for (dynamic article in jsonData["articles"]) {
        topHeadlines.add(
          NewsArticle(
            author: article["author"],
            title: article["title"],
            description: article["description"],
            urlToImage: article["urlToImage"]
          )
        );
      }
      return BreakingNewsList(articles: topHeadlines);
    }
    return null;
  }

  Future<List<NewsArticle>?> search(String query) async {
    Response response = await get(
        Uri.parse("${_baseUrl}everything?q=$query"),
        headers: _headers
    );
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<NewsArticle> queryResults = [];
      for (dynamic article in jsonData["articles"]) {
        queryResults.add(
            NewsArticle(
                author: article["author"],
                title: article["title"],
                description: article["description"],
                urlToImage: article["urlToImage"]
            )
        );
      }
      return queryResults;
    }
  }

}