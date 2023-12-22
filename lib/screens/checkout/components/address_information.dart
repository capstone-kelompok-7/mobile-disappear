import 'package:disappear/screens/checkout/address/checkout_address_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//INFORMASI PENGIRIMAN KOMPONEN CHECKOUT SCREEN//f

class AddressInfomation extends StatefulWidget {
  const AddressInfomation({super.key});

  @override
  State<AddressInfomation> createState() => _AddressInfomationState();
}

class _AddressInfomationState extends State<AddressInfomation> {
  @override
  void initState() {
    final checkoutAddressViewModel = Provider.of<CheckoutAddressViewModel>(context, listen: false);

    checkoutAddressViewModel.getAddress();

    super.initState();
  }

  void _goToAddressListScreen() {
    Navigator.pushNamed(context, CheckoutAddressScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            color: neutral00,
            padding: const EdgeInsets.only(top: 15, bottom: 15, left: 25),
            height: 48,
            width: double.infinity,
            child:const Text(
              'Informasi Pengiriman',
              style: semiBoldBody7,
            ),
          ),
          InkWell(
            onTap: _goToAddressListScreen,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 25),
              child: Consumer<CheckoutAddressViewModel>(
                builder: (context, state, _) {
                  if (state.isLoading) {
                    return const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: primary40,
                        strokeWidth: 3,
                      ),
                    );
                  }

                  if (state.address != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/img/CheckoutPinpoint.svg', width: 17, height: 17,),
                                const SizedBox(width: 10),
                                const Text('Alamat Pengiriman', style: mediumBody8,),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 27),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.address!.acceptedName,
                                        style: mediumBody8,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${state.address!.phone} | ${state.address!.address}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: mediumBody8,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: primary40,
                        ),
                      ],
                    );
                  }

                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('Pilih alamat', style: mediumBody8,)]
                  );
                }
              ),
            ),
          ),
        ],
      );
  }
}
