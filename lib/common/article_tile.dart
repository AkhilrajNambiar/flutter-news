import 'package:flutter/material.dart';
import 'package:news_time/models/news_article.dart';

class ArticleTile extends StatelessWidget {

  final NewsArticle article;

  const ArticleTile({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
        child: ListTile(
          title: Text(
            article.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            article.description ?? "Empty description",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          leading: SizedBox(
            width: 100.0,
            height: 100.0,
            child: (article.urlToImage != null) ? Image.network(
                article.urlToImage!
            ) : Image.asset("assets/image_not_found.png"),
          ),
          trailing: IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // save this article
            },
          ),
        )
    );;
  }
}
