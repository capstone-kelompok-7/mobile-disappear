import 'package:disappear/models/checkout/created_order_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_address_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_voucher_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPaymentTotal extends StatefulWidget {
  const DetailPaymentTotal({super.key});

  @override
  State<DetailPaymentTotal> createState() => _DetailPaymentTotalState();
}

class _DetailPaymentTotalState extends State<DetailPaymentTotal> {
  void _createOrder() async {
    final checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);

    final checkoutAddressViewModel = Provider.of<CheckoutAddressViewModel>(context, listen: false);
    final checkoutVoucherViewModel = Provider.of<CheckoutVoucherViewModel>(context, listen: false);
    final checkoutPaymentMethodViewModel = Provider.of<CheckoutPaymentMethodViewModel>(context, listen: false);

    final CreatedOrder? createdOrder = await checkoutViewModel.createOrder(
      addressId: checkoutAddressViewModel.address!.id,
      voucherId: checkoutVoucherViewModel.voucher!.voucherId,
      paymentMethod: checkoutPaymentMethodViewModel.method!
    );

    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: neutral00,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          height: 48,
          width: double.infinity,
          child: const Text(
            'Detail Pembayaran',
            style: semiBoldBody7,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Produk',
                    style: semiBoldBody8,
                  ),
                  Consumer<CheckoutViewModel>(
                    builder: (context, state, _) {
                      return Text(
                        state.formattedTotalProductPrice,
                        style: regularBody8,
                      );
                    }
                  )
                ],
              ),
              const SizedBox(height: 15),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Biaya Admin',
                    style: regularBody8,
                  ),
                  Text(
                    'Rp 2.000',
                    style: regularBody8,
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Voucher',
                    style: regularBody8,
                  ),
                  Consumer<CheckoutVoucherViewModel>(
                    builder: (context, state, _) {
                      if (state.voucher != null) {
                        return Text(
                          state.voucher!.voucher.formattedDiscount,
                          style: regularBody8,
                        );
                      }

                      return const Text('Rp 0', style: regularBody8);
                    }
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Diskon Produk',
                    style: regularBody8,
                  ),
                  Consumer<CheckoutViewModel>(
                    builder: (context, state, _) {
                      return Text(
                        state.formattedTotalProductDiscount,
                        style: regularBody8,
                      );
                    }
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Pembayaran',
                    style: semiBoldBody8,
                  ),
                  Consumer2<CheckoutViewModel, CheckoutVoucherViewModel>(
                    builder: (context, stateCheckout, stateVoucher, _) {
                      if (stateVoucher.voucher != null) {
                        return Text(
                          stateCheckout.totalPrice(voucher: stateVoucher.voucher!),
                          style: regularBody8,
                        );
                      }

                      return const Text('Rp 0');
                    }
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1, thickness: 0.1,),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dibayar Oleh Pelanggan',
                style: regularBody8,
              ),
              Consumer2<CheckoutViewModel, CheckoutVoucherViewModel>(
                builder: (context, stateCheckout, stateVoucher, _) {
                  return Text(
                    stateCheckout.totalPrice(voucher: stateVoucher.voucher),
                    style: semiBoldBody7,
                  );
                }
              ),
            ],
          ),
        ),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  height: double.infinity,
                  color: neutral00,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Total Pembayaran',
                        style: mediumBody8,
                      ),
                      const SizedBox(height: 8),
                      Consumer2<CheckoutViewModel, CheckoutVoucherViewModel>(
                        builder: (context, stateCheckout, stateVoucher, _) {
                          return Text(
                            stateCheckout.totalPrice(voucher: stateVoucher.voucher),
                            style: semiBoldBody7,
                          );
                        }
                      ),
                    ],
                  )
                ),
              ),
              Expanded(
                flex: 2,
                child: Consumer2<CheckoutAddressViewModel, CheckoutPaymentMethodViewModel>(
                  builder: (context, stateAddress, statePayment, _) {
                    return ElevatedButton(
                      onPressed: (stateAddress.address != null && statePayment.method != null) ? _createOrder : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary30,
                        shape: const BeveledRectangleBorder()
                      ),
                      child: Text('Buat Pesanan', style: semiBoldBody6.copyWith(color: whiteColor)
                    ),
                    );
                  }
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
