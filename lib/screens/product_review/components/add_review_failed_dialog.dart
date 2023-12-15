import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReviewFailedDialog extends StatefulWidget {
  const AddReviewFailedDialog({
    super.key
  });

  @override
  State<AddReviewFailedDialog> createState() => _AddReviewFailedDialogState();
}

class _AddReviewFailedDialogState extends State<AddReviewFailedDialog> {
  void _goToCompletedOrderScreen() {
    
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/img/FailedIcon.svg'),
          const SizedBox(height: 15,),
          const Text(
            'Ooops!!',
            style: semiBoldBody3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5,),
          const Text(
            'Sepertinya ada kesalahan server internal, nih. Atau pastikan koneksi mu dalam kondisi baik, ya. Coba lagi, yuk!!',
            style: regularBody6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: _goToCompletedOrderScreen,
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