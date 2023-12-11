import 'package:disappear/models/checkout/address/checkout_address_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CheckoutAddressItem extends StatelessWidget {
  final CheckoutAddress address;

  const CheckoutAddressItem({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutAddressViewModel>(
      builder: (context, state, _) {
        return InkWell(
          onTap: () => state.address = address,
          child: Container(
            decoration: ShapeDecoration(
              color: state.address?.id == address.id ? primary30 : whiteColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: state.address?.id == address.id ? whiteColor : blackColor
                ),
                borderRadius: BorderRadius.circular(5)
              ),
            ),
            width: double.infinity,
            height: 135,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alamat',
                            style: semiBoldBody7.copyWith(color: state.address?.id == address.id ? whiteColor : blackColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Visibility(
                            visible: address.isPrimary,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                              decoration: ShapeDecoration(
                                color: primary40,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Utama',
                                  style: semiBoldBody8.copyWith(color: whiteColor),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        address.acceptedName,
                        style: semiBoldBody6.copyWith(color: state.address?.id == address.id ? whiteColor : blackColor),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${address.phone} | ${address.address}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: mediumBody8.copyWith(color: state.address?.id == address.id ? whiteColor : blackColor),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit-old-address-screen');
                    },
                    child: SvgPicture.asset(
                      'assets/img/editProfileButton.svg',
                      colorFilter: ColorFilter.mode(state.address?.id == address.id ? whiteColor : primary40, BlendMode.srcIn),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}