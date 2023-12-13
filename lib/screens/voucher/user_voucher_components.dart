import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/screens/voucher/voucher_screen.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserVoucherComponents extends StatelessWidget {
  final VoucherModel voucherModel;
  const UserVoucherComponents({super.key, required this.voucherModel});

  @override
  Widget build(BuildContext context) {
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
                    'Kupon Potongan Harga Rp${voucherModel.discount}',
                    style: mediumBody7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    'Min. Blj Rp${voucherModel.minPurchase.toString()}',
                    style: mediumBody8,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Text(
                    'Berakhir dalam : ${voucherModel.formattedDate}',
                    style: regularBody8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
