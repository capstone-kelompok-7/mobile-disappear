import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengComponents extends StatefulWidget {
  static const String routePath = '/challenge';
  const ChallengComponents({super.key});

  @override
  State<ChallengComponents> createState() => _ChallengeComponentsState();
}

List<Map> challenges = [
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'challengeName': 'Tujuh Hari Tanpa Sampah',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '35 EXP'
  },
  {
    "imageUrl":
        'https://accurate.id/wp-content/uploads/2023/05/accurate.id-gambar-produk-ramah-lingkungan-1.png',
    'challengeName': 'Memakai Produk Ramah Lingkungan',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '20 EXP',
  },
  {
    'imageUrl':
        'https://www.ashworthcreative.com/wp-content/uploads/2011/04/usps-gogreen.png',
    'challengeName': 'Ikuti Program Ramah Lingkungan',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '15 EXP',
  },
  {
    'imageUrl':
        'https://www.ashworthcreative.com/wp-content/uploads/2011/04/usps-gogreen.png',
    'challengeName': 'Ikuti Program Ramah Lingkungan',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '15 EXP',
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'challengeName': 'Tujuh Hari Tanpa Sampah',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '35 EXP'
  },
  {
    "imageUrl":
        'https://accurate.id/wp-content/uploads/2023/05/accurate.id-gambar-produk-ramah-lingkungan-1.png',
    'challengeName': 'Memakai Produk Ramah Lingkungan',
    'effectiveDate': 'Tantangan Berlaku Sampai Tanggal 12-03-2023',
    'exp': '20 EXP',
  },
];

class _ChallengeComponentsState extends State<ChallengComponents> {
  Widget listChallenges() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(
              right: 25,
              left: 25,
              bottom: 15,
            ),
            width: 340,
            height: 171,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  challenges[index]['imageUrl'].toString(),
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 53,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            challenges[index]['challengeName'].toString(),
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            challenges[index]['effectiveDate'].toString(),
                            style: GoogleFonts.inter().copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      challenges[index]['exp'].toString(),
                      style: GoogleFonts.inter().copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return listChallenges();
  }
}
