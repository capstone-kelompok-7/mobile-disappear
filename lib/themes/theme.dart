import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

const inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Color(0xffF5F5F5),
  hintStyle: regularBody7,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(width: 1, color: neutral30)
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(width: 1, color: neutral30)
  ),
  outlineBorder: BorderSide(width: 1, color: neutral30),
  suffixIconColor: neutral40,
);

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    backgroundColor: primary40,
    foregroundColor: whiteColor,
    disabledBackgroundColor: neutral00,
    disabledForegroundColor: whiteColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    textStyle: semiBoldBody1,
  )
);