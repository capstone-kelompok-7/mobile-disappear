import 'package:disappear/screens/main_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddReviewSuccessDialog extends StatefulWidget {
  const AddReviewSuccessDialog({
    super.key
  });

  @override
  State<AddReviewSuccessDialog> createState() => _AddReviewSuccessDialogState();
}

class _AddReviewSuccessDialogState extends State<AddReviewSuccessDialog> {
  void _goToCompletedOrderScreen() {
    final mainViewModel = Provider.of<MainViewModel>(context, listen: false);
    mainViewModel.selectedScreenIndex = 2;
    
    Navigator.of(context).pushReplacementNamed(MainScreen.routePath);
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
          SvgPicture.asset('assets/img/SuccessIcon.svg'),
          const SizedBox(height: 15,),
          const Text(
            'Yuhuuu!!',
            style: semiBoldBody3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5,),
          const Text(
            'Selamat! Ulasan mu sudah berhasil disimpan, nih. Terima kasih sudah memberikan ulasan produk!!',
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