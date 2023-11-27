import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class UseCouponScreen extends StatefulWidget {
  static const String routePath = '/use-coupon-screen';
  const UseCouponScreen({super.key});

  @override
  State<UseCouponScreen> createState() => _UseCouponScreenState();
}

class _UseCouponScreenState extends State<UseCouponScreen> {
  int? selectedRadio;

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
      'discounts': '100.000',
      'minimumSpending': '10.000',
      'effectiveDate': '20 Des 2023'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kupon'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          right: 26,
          bottom: 15,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(primary30),
            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 41)),
          ),
          child: const Text(
            'Pakai Kupon',
            style: semiBoldBody6,
          ),
        ),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: vouchers.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 219,
                margin: const EdgeInsets.only(
                  top: 18,
                  left: 37,
                  right: 36,
                  bottom: 2,
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
                      width: 166,
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 10.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Kupon Potongan Harga ',
                            style: mediumBody7,
                          ),
                          Text('Rp${vouchers[index]['discounts']}',
                              style: mediumBody7),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Min. Blj Rp${vouchers[index]['minimumSpending']}',
                            style: mediumBody8,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Berakhir dalam : ${vouchers[index]['effectiveDate']}',
                            style: regularBody8,
                          ),
                        ],
                      ),
                    ),
                    Radio(
                      value: index,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value;
                        });
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
