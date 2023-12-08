import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/screens/category/components/categories_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatefulWidget {
  final VoucherModel voucherModel;
  // static const String routePath = '/voucher-screen';
  const VoucherScreen({super.key, required this.voucherModel});

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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 280, left: 29, bottom: 15),
          child: Text('Kupon Ku', style: mediumBody5.copyWith()),
        ),
        listVoucherUser(),
        Padding(
          padding:
              const EdgeInsets.only(right: 170, left: 29, top: 25, bottom: 15),
          child: Text('Kupon Potongan Harga', style: mediumBody5.copyWith()),
        ),
        vouchersToClaimComponent()
      ],
    );
  }

  Widget listVoucherUser() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: vouchers.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 332,
            margin: const EdgeInsets.only(
              left: 29,
              right: 29,
              bottom: 12,
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
                  width: 219,
                  height: 100,
                  padding: const EdgeInsets.only(
                    left: 7,
                    top: 19.5,
                    bottom: 19.5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Kupon Potongan Harga Rp${vouchers[index]['discounts'].toString()}',
                          style: mediumBody7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          'Min. Blj Rp${vouchers[index]['minimumSpending'].toString()}',
                          style: mediumBody8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Expanded(
                        child: Text(
                          'Berakhir dalam : ${vouchers[index]['effectiveDate'].toString()}',
                          style: regularBody8,
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

  // Widget vouchersToClaimComponent() {
  //   return Consumer<ChallengeMainViewModel>(builder: (context, state, _) {
  //     return FutureBuilder(
  //         future: state.fetchVouchersToClaim(),
  //         builder: (context, snapshot) {
  //           if (snapshot.hasError) {
  //             return Padding(
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
  //               child: const Text('Tidak ada voucher tersedia untuk di klaim'),
  //             );
  //           }

  //           if (snapshot.hasData) {
  //             return ListView.builder(
  //               shrinkWrap: true,
  //               physics: const NeverScrollableScrollPhysics(),
  //               itemCount: vouchers.length,
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   height: 100,
  //                   width: 332,
  //                   margin: const EdgeInsets.only(
  //                     left: 29,
  //                     right: 29,
  //                     bottom: 12,
  //                   ),
  //                   decoration: BoxDecoration(
  //                       border: Border.all(
  //                     color: Colors.black,
  //                   )),
  //                   child: Row(
  //                     children: [
  //                       SizedBox(
  //                         height: 113,
  //                         width: 100,
  //                         child: Image.network(
  //                           'https://s3.amazonaws.com/thumbnails.venngage.com/template/5456834b-ba95-41a9-85b2-4abd4d313c11.png',
  //                           fit: BoxFit.fill,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: 219,
  //                         height: 100,
  //                         padding: const EdgeInsets.only(
  //                           left: 7,
  //                           top: 19.5,
  //                           bottom: 19.5,
  //                         ),
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             Expanded(
  //                               child: Text(
  //                                 'Kupon Potongan Harga ${widget.voucherModel.discount.toString()}',
  //                                 style: mediumBody7,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                             ),
  //                             const SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(
  //                               'Min. Blj Rp${widget.voucherModel.minPurchase.toString()}',
  //                               style: mediumBody8,
  //                               overflow: TextOverflow.ellipsis,
  //                             ),
  //                             const SizedBox(
  //                               height: 3,
  //                             ),
  //                             Expanded(
  //                               child: Row(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceAround,
  //                                 children: [
  //                                   Text(
  //                                     'Berakhir dalam : ${widget.voucherModel.endDate.toString()}',
  //                                     style: regularBody8,
  //                                   ),
  //                                   SizedBox(
  //                                     width: 3,
  //                                   ),
  //                                   ElevatedButton(
  //                                     onPressed: () {},
  //                                     child: Text('Klaim'),
  //                                     style: ButtonStyle(
  //                                       backgroundColor:
  //                                           MaterialStateProperty.all<Color>(
  //                                               primary30),
  //                                       // Set minimum size constraints for the button
  //                                       minimumSize:
  //                                           MaterialStateProperty.all<Size>(
  //                                         Size(53, 21),
  //                                       ), // Adjust width and height as needed
  //                                       // Optionally, set padding
  //                                       padding: MaterialStateProperty.all<
  //                                               EdgeInsetsGeometry>(
  //                                           EdgeInsets.symmetric(
  //                                               horizontal:
  //                                                   2)), // Adjust padding as needed
  //                                       textStyle: MaterialStateProperty.all<
  //                                           TextStyle>(
  //                                         TextStyle(
  //                                             fontSize:
  //                                                 10), // Adjust font size as needed
  //                                       ),
  //                                     ),
  //                                     // You can also set other properties like textStyle, shape, etc. here
  //                                     // For example, to change the text style:
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 );
  //               },
  //             );
  //           }
  //           return CircularProgressIndicator();
  //         });
  //   });
  // }

  Widget vouchersToClaimComponent() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vouchers.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 332,
          margin: const EdgeInsets.only(
            left: 29,
            right: 29,
            bottom: 12,
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
                width: 219,
                height: 100,
                padding: const EdgeInsets.only(
                  left: 7,
                  top: 19.5,
                  bottom: 19.5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Kupon Potongan Harga ${widget.voucherModel.discount.toString()}',
                        style: mediumBody7,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Min. Blj Rp${widget.voucherModel.minPurchase.toString()}',
                      style: mediumBody8,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Berakhir dalam : ${DateFormat('yyyy-MM-dd').parse(widget.voucherModel.endDate.toString())}',
                            style: regularBody8,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Klaim'),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(primary30),
                              // Set minimum size constraints for the button
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(53, 21),
                              ), // Adjust width and height as needed
                              // Optionally, set padding
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.symmetric(
                                          horizontal:
                                              2)), // Adjust padding as needed
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                TextStyle(
                                    fontSize: 10), // Adjust font size as needed
                              ),
                            ),
                            // You can also set other properties like textStyle, shape, etc. here
                            // For example, to change the text style:
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
