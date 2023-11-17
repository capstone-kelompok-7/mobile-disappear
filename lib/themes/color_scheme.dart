import 'package:flutter/material.dart';

const Color primary40 = Color(0xff25745A);
const Color primary30 = Color(0xff39AD85);
const Color primary20 = Color(0xff65CDA9);
const Color primary10 = Color(0xff9FDFCA);
const Color primary00 = Color(0xffD9F2EA);

const Color secondary40 = Color(0xffAF8050);
const Color secondary30 = Color(0xffBF9973);
const Color secondary20 = Color(0xffCFB396);
const Color secondary10 = Color(0xffDFCCB9);
const Color secondary00 = Color(0xffEFE5DC);

const Color neutral40 = Color(0xff333333);
const Color neutral30 = Color(0xff595959);
const Color neutral20 = Color(0xff808080);
const Color neutral10 = Color(0xffA6A6A6);
const Color neutral00 = Color(0xffCCCCCC);

const Color success40 = Color(0xff039900);
const Color success30 = Color(0xff05E500);
const Color success20 = Color(0xff37FF33);
const Color success10 = Color(0xff82FF80);
const Color success00 = Color(0xffCDFFCC);

const Color warning40 = Color(0xff936706);
const Color warning30 = Color(0xffDC9B09);
const Color warning20 = Color(0xffF7BC3B);
const Color warning10 = Color(0xffFAD585);
const Color warning00 = Color(0xffFDEECE);

const Color error40 = Color(0xff990000);
const Color error30 = Color(0xffE50000);
const Color error20 = Color(0xffFF3333);
const Color error10 = Color(0xffFF8080);
const Color error00 = Color(0xffFFCCCC);

const Color whiteColor = Color(0xffFFFFFF);
const Color blackColor = Color(0xff000000);

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: primary40,
  onPrimary: whiteColor,
  secondary: secondary40,
  onSecondary: whiteColor,
  error: error40,
  onError: whiteColor,
  background: whiteColor,
  onBackground: blackColor,
  surface: whiteColor,
  onSurface: blackColor,
);