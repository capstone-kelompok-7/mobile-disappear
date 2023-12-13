import 'package:another_flushbar/flushbar.dart';
import 'package:disappear/main.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSuccessFlushbar({ required String message, bool withIcon = false }) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: const Color(0xffE3FFF1),
    messageColor: neutral40,
    borderColor: const Color(0xff04C800),
    borderWidth: 1,
    margin: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(5),
    icon: withIcon ? SvgPicture.asset('assets/img/SuccessIcon.svg', width: 20, height: 20,) : null,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(navigatorKey.currentContext!);
}

void showFailedFlushbar({ required String message, bool withIcon = false }) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: error10,
    messageColor: whiteColor,
    borderColor: error30,
    borderWidth: 1,
    margin: const EdgeInsets.all(10),
    borderRadius: BorderRadius.circular(5),
    icon: withIcon ? SvgPicture.asset('assets/img/FailedIcon.svg', width: 20, height: 20,) : null,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(navigatorKey.currentContext!);
}