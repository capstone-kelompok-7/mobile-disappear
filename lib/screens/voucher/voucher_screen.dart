import 'package:disappear/helper.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoucherScreen extends StatefulWidget {
  final Voucher voucherModel;
  
  const VoucherScreen({super.key, required this.voucherModel});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengeMainViewModel>(builder: (context, state, _) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 120,
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
                      widget.voucherModel.voucher.category,
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
                    widget.voucherModel.voucher.name,
                    style: mediumBody7,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Min. Blj ${formattedPrice(widget.voucherModel.voucher.minPurchase)}',
                    style: mediumBody8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Berakhir dalam : ${formattedDate(widget.voucherModel.voucher.endDate)}',
                    style: regularBody8,
                  ),
                  ElevatedButton(
                    onPressed: () => state.claimVoucher(widget.voucherModel.id),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(primary30),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(53, 21)),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 2)),
                      textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(fontSize: 10)),
                    ),
                    child: state.isLoadingVoucherClaim == widget.voucherModel.id
                      ? const Text('Klaim...')
                      : const Text('Klaim'),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
