import 'package:disappear/screens/search_product/components/history_item.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:disappear/view_models/search_product/search_history_view_model.dart';
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const SearchField(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Consumer2<SearchHistoryViewModel, SearchFieldViewModel>(
            builder: (context, searchHistoryState, searchFieldState, _) {
              return Visibility(
                visible: searchHistoryState
                  .getHistoriesByKeyword(searchFieldState.keyword)
                  .isNotEmpty,
                child: const Text(
                  'Pencarian terakhir',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)
                ),
              );
            }
          ),
          const SizedBox(height: 5,),
          Consumer2<SearchHistoryViewModel, SearchFieldViewModel>(
            builder: (context, searchHistoryState, searchFieldState, _) {
              return Column(
                children: searchHistoryState
                  .getHistoriesByKeyword(searchFieldState.keyword)
                  .map((String title) => HistoryItem(title: title))
                  .toList(),
              );
            }
          )
        ],
      ),
    );
  }
}