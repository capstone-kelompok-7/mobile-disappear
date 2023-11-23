import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordVerificationFailedDialog extends StatefulWidget {
  const ForgotPasswordVerificationFailedDialog({
    super.key,
    required this.message,
    required this.email,
  });

  final String message;
  final String email;

  @override
  State<ForgotPasswordVerificationFailedDialog> createState() => _ForgotPasswordVerificationFailedDialogState();
}

class _ForgotPasswordVerificationFailedDialogState extends State<ForgotPasswordVerificationFailedDialog> {
  void _goToVerificationScreen() {
    Navigator.of(context).pop();
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
          Text(
            widget.message,
            style: regularBody6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: _goToVerificationScreen,
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