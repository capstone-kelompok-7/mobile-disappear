import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  void _onSearchFieldSubmitted(String? keyword) {
    Provider.of<SearchHistoryViewModel>(context, listen: false).addHistory(keyword);
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(width: 0, color: Colors.transparent)
    );

    return SizedBox(
      height: 35,
      child: Consumer<SearchFieldViewModel>(
        builder: (context, state, _) {
          return TextFormField(
            controller: state.searchController,
            cursorColor: Colors.black,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: _onSearchFieldSubmitted,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xfff5f5f5),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: border,
              focusedBorder: border,
              enabledBorder: border,
              errorBorder: border,
              disabledBorder: border,
              prefixIcon: const Icon(Icons.search),
              prefixIconColor: Colors.black,
              suffixIcon: GestureDetector(
                onTap: state.searchController.clear,
                child: const Icon(Icons.clear)
              ),
              suffixIconColor: Colors.black,
              hintText: 'Pencarian',
              contentPadding: const EdgeInsets.only(top: 3),
            ),
          );
        }
      ),
    );
  }
}