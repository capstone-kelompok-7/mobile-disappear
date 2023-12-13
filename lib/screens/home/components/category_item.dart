import 'package:disappear/models/category_model.dart';
import 'package:disappear/screens/home/components/placeholders/category_thumbnail_placeholder.dart';
import 'package:disappear/screens/search_product/search_product_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/search_product/search_field_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatefulWidget {
  final CategoryModel category;

  const CategoryItem({
    super.key,
    required this.category
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  void _goToSearchScreen() {
    final searchFieldViewModel = Provider.of<SearchFieldViewModel>(context, listen: false);

    Future.delayed(const Duration(milliseconds: 500), () {
      searchFieldViewModel.searchController.text = widget.category.name;
      searchFieldViewModel.formKey.currentState?.save();
    });

    Navigator.pushNamed(context, SearchProductScreen.routePath);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToSearchScreen,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Builder(
              builder: (context) {
                if (widget.category.photo != '') {
                  return Image.network(
                    widget.category.photo,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const CategoryThumbnailPlaceholder();
                      }
                  
                      return child;
                    },
                  );
                }

                return Image.asset(
                  'assets/img/CategoryExample.png',
                  width: 60,
                  height: 60,
                );
              }
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            widget.category.name,
            style: mediumBody8.copyWith(color: neutral40)
          )
        ],
      ),
    );
  }
}