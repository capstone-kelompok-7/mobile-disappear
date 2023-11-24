import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordFailedDialog extends StatefulWidget {
  const ResetPasswordFailedDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<ResetPasswordFailedDialog> createState() => _ResetPasswordFailedDialogState();
}

class _ResetPasswordFailedDialogState extends State<ResetPasswordFailedDialog> {
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