import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  List<Article> articles;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        articles: List<Article>.from(
            json["Articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  final int articleID;
  final String image;
  final String title;
  final String? Description;
  final int readTime;
  final String date;
  final String? category;
  final int? writerID;

  Article({
    required this.articleID,
    required this.image,
    required this.title,
    this.Description,
    required this.readTime,
    required this.date,
     this.category,
    this.writerID,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      articleID: json['articleID'],
      image: json['image'],
      title: json['title'],
      Description: json['Description'],
      readTime: json['readTime'],
      date: json['date'],
      category: json['category'],
      writerID: json['writerID'],
    );
  }
  Map<String, dynamic> toJson() => {
        "articleID": articleID,
        "image": image,
        "title": title,
        "Description": Description,
        "readTime": readTime,
        "date": date,
        "category": category,
        "writerID": writerID,
      };
}
