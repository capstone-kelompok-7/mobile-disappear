import 'package:disappear/helper.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClaimableVoucher extends StatefulWidget {
  final Voucher voucherModel;
  
  const ClaimableVoucher({super.key, required this.voucherModel});

  @override
  State<ClaimableVoucher> createState() => _ClaimableVoucherState();
}

class _ClaimableVoucherState extends State<ClaimableVoucher> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengeMainViewModel>(builder: (context, state, _) {
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
                      widget.voucherModel.category,
                      style: semiBoldBody8.copyWith(color: whiteColor)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.voucherModel.name,
                      style: mediumBody7,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Min. Blj ${formattedPrice(widget.voucherModel.minPurchase)}',
                                  style: mediumBody8,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Berakhir dalam : ${formattedDate(widget.voucherModel.endDate, format: 'dd MMM y')}',
                                  style: mediumBody8,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: ElevatedButton(
                              onPressed: state.isLoadingVoucherClaim == widget.voucherModel.id
                                ? null
                                : () => state.claimVoucher(widget.voucherModel.id!),
                              style: ElevatedButton.styleFrom(
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)
                                ),
                                backgroundColor: primary30,
                                minimumSize: const Size(53, 21),
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                textStyle: mediumBody8,
                              ),
                              child: state.isLoadingVoucherClaim == widget.voucherModel.id
                                ? const SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: CircularProgressIndicator(
                                      color: whiteColor,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text('Klaim'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
