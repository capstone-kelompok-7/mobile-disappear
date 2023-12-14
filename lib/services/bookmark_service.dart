// import 'package:dio/dio.dart';
// import 'package:disappear/models/article_model.dart';
// import 'package:disappear/services/api.dart';

// class BookmarkService {
//   Future<ArticleModel> getSavedArticle(int articleId) async {
//     final dio = createDio();

//     final Response response = await dio.get('/articles/bookmark?=$articleId');

//     final data = response.data['data'];

//     return ArticleModel(
//       id: data['id'] as int,
//       title: data['title'] as String,
//       photo: data['photo'] as String,
//       content: data['content'] as String,
//       author: data['author'] as String,
//       date: data['date'] as String,
//       views: data['views'] as int,
//     );
//   }

//   Future<void> toggleBookmarkStatus(int articleId) async {
//     final dio = createDio();

//     final Map<String, dynamic> data = {'articleId': articleId};

//     await dio.post('/articles/bookmark', data: data);
//   }
// }
