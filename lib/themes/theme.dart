import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

const neutralTextFormFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(5)),
  borderSide: BorderSide(width: 1, color: neutral30)
);

final inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: const Color(0xffF5F5F5),
  hintStyle: regularBody7,
  border: neutralTextFormFieldBorder,
  enabledBorder: neutralTextFormFieldBorder,
  focusedBorder: neutralTextFormFieldBorder,
  focusedErrorBorder: neutralTextFormFieldBorder,
  errorBorder: neutralTextFormFieldBorder,
  errorStyle: mediumBody8.copyWith(color: error30),
  outlineBorder: const BorderSide(width: 1, color: neutral30),
  suffixIconColor: neutral40,
);

final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    minimumSize: const Size(0, 60),
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