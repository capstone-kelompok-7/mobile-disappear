import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      contentPadding: EdgeInsets.all(40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              color: primary40,
              strokeWidth: 5,
            ),
          ),
          SizedBox(height: 30,),
          Text('Memuat')
        ],
      ),
    );
  }
}