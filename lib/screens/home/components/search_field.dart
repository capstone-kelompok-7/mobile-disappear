import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  void _goToSearchScreen() {
    Navigator.pushNamed(context, SearchProductScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: _goToSearchScreen,
        child: TextFormField(
          style: regularBody6.copyWith(decoration: TextDecoration.none, decorationThickness: 0),
          decoration: InputDecoration(
            enabled: false,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            fillColor: primary00,
            hintText: 'Pencarian',
            hintStyle: regularBody6.copyWith(color: primary40),
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: primary40,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.transparent)
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.transparent)
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: Colors.transparent)
            )
          ),
        ),
      ),
    );
  }
}