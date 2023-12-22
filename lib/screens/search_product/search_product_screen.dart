import 'package:disappear/screens/search_product/histories_screen.dart';
import 'package:disappear/screens/search_product/products_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:disappear/screens/search_product/components/search_field.dart';
import 'package:provider/provider.dart';

class SearchProductScreen extends StatelessWidget {
  static const String routePath = '/search-product';

  const SearchProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        foregroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const SearchField(),
      ),
      body: Consumer<SearchProductViewModel>(
        builder: (context, state, _) {
          if (state.isOnSearch) {
            return const ProductsScreen();
          }

          return const HistoriesScreen();
        },
      ),
    );
  }
}