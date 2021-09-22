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
  final int id;
  final String image;
  final String title;
  final String? Description;
  final int readTime;
  final String date;
  final String? category;
  final int? writerID;

  Article({
    required this.id,
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
      id: json['id'],
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
        "id": id,
        "image": image,
        "title": title,
        "Description": Description,
        "readTime": readTime,
        "date": date,
        "category": category,
        "writerID": writerID,
      };
}

enum Id { THE_WALL_STREET_JOURNAL }

final idValues =
    EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});

enum Name { THE_WALL_STREET_JOURNAL }

final nameValues =
    EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
