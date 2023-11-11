import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeScreen extends StatefulWidget {
  static const String routePath = '/challenge';
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
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
];

class _ChallengeScreenState extends State<ChallengeScreen> {
  Widget topButton() {
    return Container(
      margin: EdgeInsets.only(
        left: 75,
        right: 75,
        top: 16,
        bottom: 37,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      width: 240,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffe4e4e4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 70,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0xffa8a8a8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 4,
              ),
              child: Text(
                'Tantangan',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 80,
            height: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 4,
              ),
              child: Text(
                'Leaderboard',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: 70,
            height: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 4,
              ),
              child: Text(
                'Kupon ku',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listChallenges(int index) {
    return Container(
      margin: EdgeInsets.only(
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
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: BoxDecoration(
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
                    SizedBox(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Tantangan',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          topButton(),
          SizedBox(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                return listChallenges(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
