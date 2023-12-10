import 'package:disappear/models/checkout/voucher/checkout_voucher_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_voucher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UseCouponScreen extends StatefulWidget {
  static const String routePath = '/use-coupon-screen';
  const UseCouponScreen({super.key});

  @override
  State<UseCouponScreen> createState() => _UseCouponScreenState();
}

class _UseCouponScreenState extends State<UseCouponScreen> {
  @override
  void initState() {
    final voucherViewModel = Provider.of<CheckoutVoucherViewModel>(context, listen: false);
    voucherViewModel.voucherFuture ??= voucherViewModel.getVoucher();

    super.initState();
  }

  void _chooseVoucher() {
    final voucherViewModel = Provider.of<CheckoutVoucherViewModel>(context, listen: false);
    voucherViewModel.voucher = voucherViewModel.selectedVoucher;

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Kupon', style: semiBoldBody1.copyWith(color: whiteColor)),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
        child: ElevatedButton(
          onPressed: _chooseVoucher,
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
      body: Consumer<CheckoutVoucherViewModel>(
        builder: (context, state, _) {
          return FutureBuilder<List<CheckoutVoucher>>(
            future: state.voucherFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isNotEmpty) {
                  final checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);
                  final vouchers = snapshot.data!
                    .where((element) => checkoutViewModel.product!.price! >= element.voucher.minPurchase)
                    .where((element) => element.voucher.endDate.isAfter(DateTime.now()))
                    .toList();

                  return ListView.separated(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: vouchers.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 15,),
                    itemBuilder: (context, index) {
                      return Consumer<CheckoutVoucherViewModel>(
                        builder: (context, state, _) {
                          return InkWell(
                            onTap: () => state.selectedVoucher = vouchers[index],
                            child: Container(
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
                                        Visibility(
                                          visible: vouchers[index].voucher.category != 'All Customer',
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              color: vouchers[index].voucher.category == 'Bronze'
                                              ? warning40
                                                : vouchers[index].voucher.category == 'Silver'
                                                ? neutral00
                                                  : vouchers[index].voucher.category == 'Gold'
                                                  ? warning30
                                                    : null,
                                              borderRadius: const BorderRadiusDirectional.only(
                                                topStart: Radius.circular(4),
                                                bottomEnd: Radius.circular(8)
                                              )
                                            ),
                                            child: Text(
                                              vouchers[index].voucher.category,
                                              style: semiBoldBody8.copyWith(color: whiteColor)
                                            ),
                                          )
                                        ),
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
                                          vouchers[index].voucher.name,
                                          style: mediumBody7,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Min. Blj ${vouchers[index].voucher.formattedMinPurchase}',
                                          style: mediumBody8,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Berakhir dalam : ${vouchers[index].voucher.formattedEndDate}',
                                          style: regularBody8,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Radio<CheckoutVoucher>(
                                      value: vouchers[index],
                                      groupValue: state.selectedVoucher,
                                      onChanged: (value) => state.selectedVoucher = value,
                                    ),
                                  )
                                ],
                              ),
                            )
                          );
                        }
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('Kamu masih belum punya kupon apapun'));
                }
              }
          
              return const Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: primary40,
                    strokeWidth: 3,
                  ),
                ),
              );
            }
          );
        }
      )
    );
  }
}
