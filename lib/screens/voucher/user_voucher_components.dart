import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class UserVoucherComponents extends StatelessWidget {
  final VoucherModel voucherModel;

  const UserVoucherComponents({super.key, required this.voucherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: blackColor,
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(right: BorderSide(width: 1, color: blackColor)),
                    color: primary40
                  ),
                  child: Image.asset(
                    'assets/img/Coupon.png',
                    height: double.infinity,
                    width: 113,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: warning40,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(4),
                      bottomEnd: Radius.circular(8)
                    )
                  ),
                  child: Text(
                    voucherModel.category!,
                    style: semiBoldBody8.copyWith(color: whiteColor)
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  voucherModel.name!,
                  style: mediumBody7,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Min. Blj ${voucherModel.formattedMinPurchase}',
                  style: mediumBody8,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Berakhir dalam : ${voucherModel.formattedEndDate}',
                  style: regularBody8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
