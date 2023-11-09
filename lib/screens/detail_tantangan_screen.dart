import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailTantanganScreen extends StatelessWidget {
  static const String routePath = '/detail-tantangan-screen';
  const DetailTantanganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFinished = true;

    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Detail Tantangan',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 45, right: 45, top: 47, bottom: 150),
            child: Container(
              height: 399,
              width: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tantangan Menanam Pohon',
                    style: GoogleFonts.inter().copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Tantangan Berlaku Sampai Tanggal 12-03-2023',
                    style: GoogleFonts.inter().copyWith(
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '35 EXP',
                    style: GoogleFonts.inter().copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff767676),
                    ),
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
          ),
          isFinished
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 45, right: 42, bottom: 22),
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
