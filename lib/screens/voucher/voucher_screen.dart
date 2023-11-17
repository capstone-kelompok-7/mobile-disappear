import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VoucherScreen extends StatefulWidget {
  static const String routePath = '/voucher-screen';
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

List<Map<String, dynamic>> vouchers = [
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '5000',
    'minimumSpending': '30.000',
    'effectiveDate': '5 Nov 2023'
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '15.000',
    'minimumSpending': '50.000',
    'effectiveDate': '10 Nov 2023'
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '10.000',
    'minimumSpending': '40.000',
    'effectiveDate': '6 Nov 2023'
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '50.000',
    'minimumSpending': '10.000',
    'effectiveDate': '20 Des 2023'
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '10.000',
    'minimumSpending': '20.000',
    'effectiveDate': '12 Des 2023'
  },
  {
    'imageUrl':
        'https://rimbakita.com/wp-content/uploads/2020/10/hari-bebas-kantong-plastik-sedunia.jpg',
    'discounts': '30.000',
    'minimumSpending': '40.000',
    'effectiveDate': '30 Nov 2023'
  },
];

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    Widget topButton() {
      return Container(
        margin: const EdgeInsets.only(
          left: 75,
          right: 75,
          top: 16,
          bottom: 37,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        width: 240,
        height: 30,
        decoration: const BoxDecoration(
          color: Color(0xffe4e4e4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 70,
              height: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                child: Center(
                  child: Text(
                    'Tantangan',
                    style: GoogleFonts.inter().copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 80,
              height: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                child: Center(
                  child: Text(
                    'Leaderboard',
                    style: GoogleFonts.inter().copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: 70,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xffa8a8a8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 4,
                ),
                child: Center(
                  child: Text(
                    'Kupon ku',
                    style: GoogleFonts.inter().copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget listVoucher() {
      return SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              width: 323,
              margin: const EdgeInsets.only(
                left: 28,
                right: 39,
                bottom: 28,
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: Row(
                children: [
                  SizedBox(
                    height: 113,
                    width: 100,
                    child: Image.network(
                      'https://s3.amazonaws.com/thumbnails.venngage.com/template/5456834b-ba95-41a9-85b2-4abd4d313c11.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: 210,
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'Kupon Potongan Harga Rp${vouchers[index]['discounts'].toString()}',
                            style: GoogleFonts.inter().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Min. Blj Rp${vouchers[index]['minimumSpending'].toString()}',
                            style: GoogleFonts.inter().copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Berakhir dalam : ${vouchers[index]['effectiveDate'].toString()}',
                            style: GoogleFonts.inter().copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Kupon',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          topButton(),
          listVoucher(),
        ],
      ),
    );
  }
}