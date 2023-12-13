import 'package:intl/intl.dart';

class ArticleModel {
  int id;
  String title;
  String photo;
  String? content;
  String author;
  String date;
  int views;

  ArticleModel(
      {required this.id,
      required this.title,
      required this.photo,
      this.content,
      required this.author,
      required this.date,
      required this.views});

  String get formattedDate {
    final f = DateFormat('d MMMM yyyy');
    return f.format(DateTime.parse(date));
  }
}
