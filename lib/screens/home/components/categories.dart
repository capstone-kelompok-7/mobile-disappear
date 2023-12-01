import 'package:disappear/screens/category/categories_screen.dart';
import 'package:disappear/screens/home/components/category_item.dart';
import 'package:disappear/screens/home/components/placeholders/categories_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/home/home_category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  void _goToCategoriesScreen() {
    Navigator.pushNamed(context, CategoriesScreen.routePath);
  }

  Widget _buildView(snapshot) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => CategoryItem(category: snapshot.data![index]),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: snapshot.data!.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryViewModel = Provider.of<HomeCategoryViewModel>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Kategori',
              style: semiBoldBody5.copyWith(color: primary40),
            ),
            GestureDetector(
              onTap: _goToCategoriesScreen,
              child: Text(
                'Lihat semua',
                style: semiBoldBody8.copyWith(color: neutral30),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15,),
        FutureBuilder(
          future: categoryViewModel.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Tidak ada kategori');
            }

            if (snapshot.hasData) {
              return _buildView(snapshot);
            }
            
            return const CategoriesPlaceholder();
          }
        ),
      ],
    );
  }
}