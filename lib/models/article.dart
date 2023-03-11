part of 'models.dart';

class Article {
  final String title;
  final String readingTime;
  final String author;
  final String details;
  final String imgLink;

  Article(
      {required this.title,
      required this.readingTime,
      required this.author,
      required this.details,
      required this.imgLink});
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        title: json["title"],
        readingTime: json["readingTime"],
        author: json["author"],
        details: json["details"],
        imgLink: json["imgLink"]);
  }
}
