import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterVerificationFailedDialog extends StatefulWidget {
  const RegisterVerificationFailedDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  State<RegisterVerificationFailedDialog> createState() => _RegisterVerificationFailedDialogState();
}

class _RegisterVerificationFailedDialogState extends State<RegisterVerificationFailedDialog> {
  void _close() {
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
          const Text(
            'Ooops!!',
            style: semiBoldBody3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5,),
          Text(
            widget.message,
            style: regularBody6,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: _close,
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