import 'package:disappear/models/product_model.dart';
import 'package:disappear/screens/home/components/placeholders/best_seller_product_thumbnail_placeholder.dart';
import 'package:disappear/screens/product/product_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherProduct extends StatefulWidget {
  final ProductModel product;

  const OtherProduct({super.key, required this.product});

  @override
  State<OtherProduct> createState() => _OtherProductState();
}

class _OtherProductState extends State<OtherProduct> {
  void _goToProductScreen() {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.productId = widget.product.id;

    Navigator.pushNamed(context, ProductScreen.routePath);
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToProductScreen,
      child: SizedBox(
        width: 130,
        height: 210,
        child: Card(
          color: secondary00,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Builder(
                  builder: (context) {
                    if (widget.product.thumbnail != null) {
                      return Image.network(
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
                      );
                    }
      
                    return Image.asset(
                      'assets/img/alat_makan.png',
                      fit: BoxFit.cover,
                      width: 130,
                      height: 120,
                    );
                  }
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
                      Row(
                        children: [
                          Icon(
                            color: widget.product.rating >= 1 ? warning30 : neutral00,
                            Icons.star,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            color: widget.product.rating >= 2 ? warning30 : neutral00,
                            Icons.star,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            color: widget.product.rating >= 3 ? warning30 : neutral00,
                            Icons.star,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            color: widget.product.rating >= 4 ? warning30 : neutral00,
                            Icons.star,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Icon(
                            color: widget.product.rating >= 5 ? warning30 : neutral00,
                            Icons.star,
                            size: 16,
                          ),
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