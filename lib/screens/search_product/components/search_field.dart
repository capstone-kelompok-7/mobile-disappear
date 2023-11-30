import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  void _onSearchFieldSubmitted(String? keyword) {
    if (keyword != null && keyword.isNotEmpty) {
      final searchHistoryViewModel = Provider.of<SearchHistoryViewModel>(context, listen: false);
      final searchProductsViewModel = Provider.of<SearchProductViewModel>(context, listen: false);

      searchProductsViewModel.getProducts(keyword);
      
      searchHistoryViewModel.addHistory(keyword);
    }
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(color: Colors.transparent)
    );

    return SizedBox(
      height: 35,
      child: Consumer2<SearchFieldViewModel, SearchProductViewModel>(
        builder: (context, state1, state2, _) {
          return FocusScope(
            child: Focus(
              onFocusChange: (bool isFocus) => state2.isOnSearch = !isFocus,
              child: TextFormField(
                autofocus: true,
                controller: state1.searchController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.go,
                onFieldSubmitted: _onSearchFieldSubmitted,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: primary00,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                  errorBorder: border,
                  disabledBorder: border,
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  suffixIcon: GestureDetector(
                    onTap: state1.searchController.clear,
                    child: const Icon(Icons.clear)
                  ),
                  suffixIconColor: Colors.black,
                  hintText: 'Pencarian',
                  hintStyle: regularBody6.copyWith(color: primary40),
                  contentPadding: const EdgeInsets.only(top: 3),
                ),
              )
            )
          );
        }
      ),
    );
  }
}