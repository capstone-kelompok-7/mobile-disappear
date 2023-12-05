import 'package:disappear/models/article_model.dart';
import 'package:flutter/material.dart';

class contentArticle extends StatelessWidget {
  final ArticleModel article;

  const contentArticle({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Judul
        Text(
          article.title,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 4.0,
        ),

        // Informasi Tanggal/View/Bookmark
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              article.author,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              article.date,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(
              width: 12.0,
            ),
            const Text(
              '1 minggu yang lalu', // Perhatikan: Anda perlu menghitung selisih waktu
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(
              width: 40.0,
            ),
            const Icon(
              Icons.remove_red_eye,
              size: 18,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              article.views.toString(),
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Icon(
              Icons.bookmark_border_outlined,
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        // Gambar Artikel
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            article.photo,
            width: 400,
            height: 202,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          article.content,
          // Tambahkan fungsi untuk mengubah HTML menjadi widget Flutter jika diperlukan
          // menggunakan paket seperti flutter_html
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
