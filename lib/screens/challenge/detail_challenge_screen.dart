import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailChallengeScreen extends StatelessWidget {
  static const String routePath = '/detail-tantangan-screen';
  const DetailChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFinished = true;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Detail Tantangan',
          style: semiBoldBody1
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 45, right: 45, top: 47, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tantangan Menanam Pohon',
                  style: semiBoldBody3
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Tantangan Berlaku Sampai Tanggal 12-03-2023',
                  style: regularBody8,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '35 EXP',
                  style: semiBoldBody8
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 300,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(64, 64, 64, 1),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    'Tanamlah pohon saat kamu berjalan, bermeditasi, atau memasak. Ambil foto saat kamu membuatnya. Unggah di Instagram kamu dan tag @disappear Mengapa tantangan pohon \n\nKarena pohon membantu membersihkan udara yang kita hirup, menyaring air yang kita minum, dan menyediakan habitat bagi lebih dari 80% keanekaragaman hayati di dunia. Hutan menyediakan lapangan pekerjaan bagi lebih dari 1,6 miliar orang, menyerap karbon berbahaya dari atmosfer, dan merupakan bahan utama dari 25% obat-obatan.'),
              ],
            ),
          ),
          isFinished
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 45, right: 42, bottom: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(64, 64, 64, 1),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Ikuti Tantangan',
                      style: GoogleFonts.inter(),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 10,
                )
        ],
      ),
    );
  }
}
