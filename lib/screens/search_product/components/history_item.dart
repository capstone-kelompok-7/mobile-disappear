import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
    final searchHistoryViewModel = Provider.of<SearchHistoryViewModel>(context, listen: false);
    final searchProductsViewModel = Provider.of<SearchProductViewModel>(context, listen: false);

    return ListTile(
      onTap: () {
        FocusScope.of(context).unfocus();

        searchFieldViewModel.searchController.text = title;
        
        searchProductsViewModel.getProducts(title);
      },
      title: Text(title),
      leading: const Icon(Icons.history),
      minLeadingWidth: 0,
      horizontalTitleGap: 7,
      trailing: GestureDetector(
        onTap: () => searchHistoryViewModel.clearHistory(title),
        child: const Icon(Icons.clear)
      ),
    );
  }
}
