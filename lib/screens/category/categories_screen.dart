import 'package:disappear/screens/category/components/categories_placeholder.dart';
import 'package:disappear/screens/category/components/category_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/category/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routePath = '/categories';

  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Kategori', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: Consumer<CategoryViewModel>(
        builder: (context, state, _) {
          return FutureBuilder(
            future: state.getCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Tidak ada kategori');
              }

              if (snapshot.hasData) {
                return GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 140,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(category: snapshot.data![index],);
                  },
                );
              }

              return const CategoriesPlaceholder();
            }
          );
        },
      ),
    );
  }
}