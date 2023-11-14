// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:disappear/screens/save_article_sreen.dart';
import 'package:flutter/material.dart';

class DetailArticleScreen extends StatelessWidget {
  static const String routePath = '/detail-article-screen';
  final List<String> imageUrls = [
    "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
    "https://pbs.twimg.com/media/F0bo5RyWwAETV8s?format=jpg&name=large",
    "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
  ];

  final List<String> titles = [
    '80 Persen Sampah di Laut adalah Sampah dari Daratan',
    'Penting 5 Manfaat Menjaga Kebersihan',
    "Title 3",
  ];
  DetailArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Artikel",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SaveArticleScreen()),
              );
            },
            icon:
                const Icon(Icons.bookmark_border_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Judul
              const Text(
                "Berapa Banyak Sampah Plastik yang Ada di Lautan?",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              // Informasi Tanggal/View/Bookmark
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'DISAPPEAR',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    '24-10-2023',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    '1 minggu yang lalu',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 60.0,
                  ),
                  Icon(
                    Icons.remove_red_eye,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '1045',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
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
                  "https://pbs.twimg.com/media/F-USECJX0AAfKD9?format=jpg&name=medium",
                  width: 400,
                  height: 202,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Peneliti memperkirakan jumlah sampah plastik yang memasuki lingkungan perairan dapat meningkat 2,6 kali lipat dari 2016 hingga 2040. Jika tren tersebut terus berlanjut, itu akan berpotensi menjadi hal yang lebih buruk.\n\n'
                '"Pembersihan menjadi sia-sia jika kita terus memproduksi plastik dengan kecepatan saat ini. Kita sudah terlalu lama mendengar tentang daur ulang namun industri plastik menolak komitmen apa pun untuk membeli bahan daur ulang atau desain untuk dapat di daur ulang. Sudah waktunya untuk mengatasi masalah plastik dari sumbernya," kata Marcus Eriksen, penulis studi utama dan salah satu pendiri 5 Gyres Institute.\n\n'
                'Dalam pernyataannya, peningkatan mikroplastik secara eksponensial di seluruh lautan dunia adalah peringatan keras supaya kita bertindak dalam skala global. Itu juga termasuk berhenti untuk hanya fokus pada pembersihan dan daur ulang.\n\n'
                '- Dampak sampah plastik\n'
                'Beberapa tahun terakhir makin banyak penelitian yang menyoroti bagaimana polusi dari sampah plastik berdampak pada lingkungan laut dan susunan kehidupan yang mereka miliki.\n\n'
                '"Untuk mengatasi polusi plastik secara efektif, kita harus mengatasinya dengan cara yang sistemik," jelas Patricia Patricia Villarrubia Gomez, kandidat PhD di Pusat Ketahanan Stockholm, Universitas Stockholm.\n\n'
                'Studi baru tentang dampak sampah plastik yang mencemari lautan ini telah diterbitkan dalam jurnal PLOS ONE.',
              ),
              const SizedBox(
                height: 20.0,
              ),
              //Artikel Lainnya
              const Text(
                "Artikel Lainnya",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 175,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 250,
                      margin: const EdgeInsets.all(10.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                imageUrls[index],
                                height: 175,
                                width: 250,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 61.0,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(6.0),
                                  bottomRight: Radius.circular(6.0),
                                ),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                titles[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
