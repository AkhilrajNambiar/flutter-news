import 'package:flutter/material.dart';
import 'package:news_time/pages/search_news.dart';
import 'package:news_time/wrapper.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const Wrapper(),
        "/search": (context) => const SearchNews()
      },
    );
  }
}