import 'package:dio/dio.dart';
import 'package:disappear/models/article_model.dart';
import 'package:disappear/services/api.dart';

final dummyData = [
  {
    "id": 1,
    "title": "Sampah Masyarakat",
    "photo": "",
    "content":
        "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"text-align: justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>",
    "author": "DISAPPEAR",
    "date": "2023-12-04T03:07:34Z",
    "views": 0
  },
  {
    "id": 2,
    "title": "TPA Piyungan Jogja Masih Ditutup dan Belom di Buka",
    "photo": "",
    "content":
        "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"text-align: justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>",
    "author": "DISAPPEAR",
    "date": "2023-12-04T03:19:58Z",
    "views": 0
  },
  {
    "id": 3,
    "title": "Daur Ulang Le Mineral Galon",
    "photo": "",
    "content":
        "<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"text-align: justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>",
    "author": "DISAPPEAR",
    "date": "2023-12-04T06:55:46Z",
    "views": 1
  },
  {
    "id": 4,
    "title": "pengupayaan penanaman pohon kembali",
    "photo": "",
    "content":
        "<p>demi keberlangsungan bumi yang lebih sehat, pemerintah mengupayakan dan menyuarakan penanam pohon kembali dari sekarang dan untuk masa yang mendatang</p>",
    "author": "DISAPPEAR",
    "date": "2023-12-04T07:02:28Z",
    "views": 0
  },
  {
    "id": 5,
    "title": "penanaman pohon kembali",
    "photo": "",
    "content":
        "<p>demi keberlangsungan bumi yang lebih sehat, pemerintah mengupayakan dan menyuarakan penanam pohon kembali dari sekarang dan untuk masa yang mendatang</p>",
    "author": "DISAPPEAR",
    "date": "2023-12-04T07:13:45Z",
    "views": 0
  },
  {
    "id": 6,
    "title": "Sejak memasuki tahun 2022, produksi plastik naik 15%",
    "photo": "",
    "content":
        "Studi baru tentang dampak sampah plastik yang mencemari lautan ini telah diterbitkan dalam jurnal PLOS ONE.",
    "author": "DISAPPEAR",
    "date": "2023-12-04T07:27:15Z",
    "views": 0
  },
  {
    "id": 7,
    "title": "Sejak memasuki tahun 2022, produksi plastik naik 15%",
    "photo": "",
    "content":
        "Studi baru tentang dampak sampah plastik yang mencemari lautan ini telah diterbitkan dalam jurnal PLOS ONE.",
    "author": "DISAPPEAR",
    "date": "2023-12-04T08:51:26Z",
    "views": 0
  },
  {
    "id": 8,
    "title": "Sejak memasuki tahun 2022, produksi plastik naik 15%",
    "photo":
        "https://res.cloudinary.com/dufa4bel6/image/upload/v1701680681/disappear/x2za0nl3vpibhkb3fbnx.png",
    "content":
        "Studi baru tentang dampak sampah plastik yang mencemari lautan ini telah diterbitkan dalam jurnal PLOS ONE.",
    "author": "DISAPPEAR",
    "date": "2023-12-04T09:04:43Z",
    "views": 0
  },
  {
    "id": 9,
    "title": "Sejak memasuki tahun 2013, produksi plastik naik 20%",
    "photo":
        "https://res.cloudinary.com/dufa4bel6/image/upload/v1701680745/disappear/q0ddkatdnjlgjfgl0xpl.jpg",
    "content":
        "Studi baru tentang dampak sampah plastik yang mencemari lautan ini telah diterbitkan dalam jurnal PLOS ONE.",
    "author": "DISAPPEAR",
    "date": "2023-12-04T09:05:46Z",
    "views": 0
  }
];

class ArticleService {
  Future<List<ArticleModel>> getLatestArticles() async {
    final dio = createDio();

    final Response response =
        await dio.get('/articles?page=1&search=&filter_type=');
    // final response =
    //     await Future.delayed(const Duration(seconds: 1), () => dummyData);
    return response.data['data']
        // return response
        .map<ArticleModel>((data) {
      return ArticleModel(
          id: data['id'] as int,
          title: data['title'] as String,
          photo: data['photo'] as String,
          author: data['author'] as String,
          date: data['date'] as String,
          views: data['views'] as int,
          content: '');
    }).toList();
  }

  Future<List<ArticleModel>> getArticlesById(int id) async {
    final dio = createDio();

    // final Response response = await dio.get('/articles?page=1&pageSize=3');
    final response =
        await Future.delayed(const Duration(seconds: 1), () => dummyData);

    // return response.data['data']
    return response.map<ArticleModel>((data) {
      return ArticleModel(
          id: data['id'] as int,
          title: data['title'] as String,
          photo: data['photo'] as String,
          content: data['content'] as String,
          author: data['author'] as String,
          date: data['date'] as String,
          views: data['views'] as int);
    }).toList();
  }
}

// class DetailArticleService {
//   static const String _endpoint = '/articles';

//   Future<List<DetailArticleModel>> getDetailArticles() async {
//     final dio = createDio();

//     try {
//       final Response response = await dio.get(_endpoint);

//       if (response.statusCode == 200) {
//         return (response.data['data'] as List)
//             .map<DetailArticleModel>((data) => DetailArticleModel(
//                   id: data['id'],
//                   title: data['title'],
//                   photo: data['photo'],
//                   content: data['content'],
//                   author: data['author'],
//                   date: data['date'],
//                   views: data['views'],
//                 ))
//             .toList();
//       } else {
//         // Handle error, misalnya throw exception atau return empty list
//         throw Exception('Failed to load data');
//       }
//     } catch (e) {
//       // Handle DioError atau exception lainnya
//       throw Exception('Error: $e');
//     }
//   }
// }


