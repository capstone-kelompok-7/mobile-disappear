import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddToCartSuccessDialog extends StatefulWidget {
  const AddToCartSuccessDialog({super.key});

  @override
  State<AddToCartSuccessDialog> createState() => _AddToCartSuccessDialogState();
}

class _AddToCartSuccessDialogState extends State<AddToCartSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/img/SuccessIcon.svg'),
          const SizedBox(height: 15,),
          const Text(
            'Produk telah ditambah ke keranjang',
            style: regularBody6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(155, 35),
              padding: const EdgeInsets.all(0),
              backgroundColor: success30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55)
              )
            ),
            child: const Text('Oke', style: semiBoldBody6,)
          )
        ],
      ),
    );
  }
}