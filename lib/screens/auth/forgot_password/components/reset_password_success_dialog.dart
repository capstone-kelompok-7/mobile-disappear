import 'package:disappear/screens/auth/login_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordSuccessDialog extends StatefulWidget {
  const ResetPasswordSuccessDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<ResetPasswordSuccessDialog> createState() => _ResetPasswordSuccessDialogState();
}

class _ResetPasswordSuccessDialogState extends State<ResetPasswordSuccessDialog> {
  void _goToNewPasswordScreen() {
    Navigator.of(context).pop();
    Navigator.popUntil(context, ModalRoute.withName(LoginScreen.routePath));
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
          Text(
            widget.message,
            style: regularBody6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: _goToNewPasswordScreen,
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