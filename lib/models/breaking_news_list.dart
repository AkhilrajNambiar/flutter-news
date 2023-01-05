import 'news_article.dart';

class BreakingNewsList {
  List<NewsArticle> articles;

  BreakingNewsList({ required this.articles });

  @override
  String toString() {
    return "BreakingNews(${articles.toString()})";
  }
}