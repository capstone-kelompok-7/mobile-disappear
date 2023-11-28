import 'package:disappear/screens/home/components/best_seller_product_item.dart';
import 'package:disappear/screens/home/components/placeholders/best_seller_products_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/home/best_seller_product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellerProducts extends StatelessWidget {
  const BestSellerProducts({super.key});

  Widget _buildView(snapshot) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = BestSellerProductItem(product: snapshot.data![index]);

          if (index == 0) {
            return Row(
              children: [
                const SizedBox(width: 10,),
                product
              ]
            );
          }

          if (index == snapshot.data!.length - 1) {
            return Row(
              children: [
                product,
                const SizedBox(width: 10,),
              ]
            );
          }

          return product;
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: snapshot.data!.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Produk terlaris',
            style: semiBoldBody5.copyWith(color: primary40),
          ),
        ),
        const SizedBox(height: 16,),
        Consumer<BestSellerProductViewModel>(
          builder: (context, state, _) {
            return FutureBuilder(
              future: state.getBestSellerProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Tidak ada produk'));
                }
            
                if (snapshot.hasData) {
                  return _buildView(snapshot);
                }
                
                return const BestSellerProductsPlaceholder();
              }
            );
          }
        ),
      ],
    );
  }
}