//creating the article model
//for that we just need to copy property from json structure
//and make it into dart object

import 'dart:convert';

class Article{
  String id;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article(
      {required this.id,
      required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.title,
      required this.url,
      required this.urlToImage});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'author': author,
      'content': content,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt.toString(),
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as String,
      title: map['title'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      content: map['content'] as String,
      description: map['description'] as String,
      author: map['author'] as String,
      publishedAt: DateTime.parse(map['publishedAt'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Article.fromJson(String source) =>
      Article.fromMap(json.decode(source) as Map<String, dynamic>);

}
