import 'package:disappear/models/product_model.dart';
import 'package:disappear/screens/home/components/placeholders/best_seller_product_thumbnail_placeholder.dart';
import 'package:disappear/screens/product_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class BestSellerProductItem extends StatefulWidget {
  final ProductModel product;

  const BestSellerProductItem({super.key, required this.product});

  @override
  State<BestSellerProductItem> createState() => _BestSellerProductItemState();
}

class _BestSellerProductItemState extends State<BestSellerProductItem> {
  void _goToProductScreen() {
    Navigator.pushNamed(context, ProductScreen.routePath);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToProductScreen,
      child: SizedBox(
        width: 130,
        height: 200,
        child: Card(
          color: secondary00,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Image.network(
                  widget.product.thumbnail!.imageUrl,
                  fit: BoxFit.cover,
                  width: 130,
                  height: 120,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const BestSellerProductThumbnailPlaceholder();
                    }

                    return child;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: mediumBody6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3,),
                      const Row(
                        children: [
                          Icon(Icons.star, size: 14, color: blackColor),
                          SizedBox(width: 2,),
                          Icon(Icons.star, size: 14, color: blackColor),
                          SizedBox(width: 2,),
                          Icon(Icons.star, size: 14, color: blackColor),
                          SizedBox(width: 2,),
                          Icon(Icons.star, size: 14, color: blackColor),
                          SizedBox(width: 2,),
                          Icon(Icons.star, size: 14, color: blackColor),
                        ],
                      ),
                      const SizedBox(height: 3,),
                      Text(widget.product.formattedPrice, style: semiBoldBody7),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}