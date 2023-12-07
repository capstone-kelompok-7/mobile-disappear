import 'package:disappear/view_models/search_product/filter_view_model.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
import 'package:disappear/view_models/search_product/search_products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryItem extends StatefulWidget {
  const HistoryItem({super.key, required this.title});

  final String title;

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  void _search() {
    FocusScope.of(context).unfocus();
    
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);
    final searchProductsViewModel = Provider.of<SearchProductViewModel>(context, listen: false);
    final filterViewModel = Provider.of<FilterViewModel>(context, listen: false);

    searchFieldViewModel.searchController.text = widget.title;
    
    filterViewModel.withPromo = false;
    filterViewModel.selectedFilter = 0;
    
    searchProductsViewModel.getProducts(keyword: widget.title);
  }

  void _clearHistory() {
    final searchHistoryViewModel = Provider.of<SearchHistoryViewModel>(context, listen: false);
    searchHistoryViewModel.clearHistory(widget.title);
  }
  
  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: _search,
      title: Text(widget.title),
      leading: const Icon(Icons.history),
      minLeadingWidth: 0,
      horizontalTitleGap: 7,
      trailing: GestureDetector(
        onTap: _clearHistory,
        child: const Icon(Icons.clear)
      ),
    );
  }
}
