class NewsArticle {
  String? author;
  String? title;
  String? description;
  String? urlToImage;

  NewsArticle({ this.author, this.title, this.description, this.urlToImage });

  @override
  String toString() {
    return 'NewsArticle{author: $author, title: $title, description: $description, urlToImage: $urlToImage}';
  }
}