import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/screens/category/components/categories_placeholder.dart';
import 'package:disappear/screens/voucher/user_voucher_components.dart';
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

class _VoucherScreenState extends State<VoucherScreen> {
  void initState() {
    final voucherViewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);

    voucherViewModel.addListener(_klaimVoucherMessageListener);

    super.initState();
  }

  void _klaimVoucherMessageListener() {
    final klaimVoucherViewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);
    if (klaimVoucherViewModel.message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(klaimVoucherViewModel.message!)));

      klaimVoucherViewModel.message = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [vouchersToClaimComponent()],
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
    return Consumer<ChallengeMainViewModel>(builder: (context, state, _) {
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
                      'Kupon Potongan Harga ${widget.voucherModel.discount}',
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
                          'Berakhir dalam : ${widget.voucherModel.formattedDate}',
                          style: regularBody8,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            state.claimVoucher(widget.voucherModel.id);
                          },
                          child: state.isLoadingVoucherClaim ==
                                  widget.voucherModel.id
                              ? CircularProgressIndicator()
                              : Text('Klaim'),
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
    });
  }
}
