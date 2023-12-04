// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, library_private_types_in_public_api, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/models/product_model.dart';
import 'package:disappear/screens/product/components/add_to_cart_dialog.dart';
import 'package:disappear/screens/product/components/other_product.dart';
import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/add_to_cart_view_model.dart';
import 'package:disappear/view_models/product/product_carousel_view_model.dart';
import 'package:disappear/view_models/product/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  static const String routePath = '/product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late final Future productFuture = _getProduct();

  Future<ProductModel?> _getProduct() async {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    final carouselViewModel = Provider.of<ProductCarouselViewModel>(context, listen: false);

    productViewModel.productId = 1;

    final product = await productViewModel.getProductById();

    carouselViewModel.product = product;

    return product;
  }

  void _showAddToCartDialog() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext builder) {
        return const SizedBox(
          width: double.infinity,
          height: 250,
          child: AddToCartDialog(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<AddToCartViewModel>(context, listen: false);

    return FutureBuilder(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          Navigator.pop(context);
        }

        if (snapshot.hasData) {
          cartViewModel.product = snapshot.data!;

          return Scaffold(
            body: ListView(
              children: [
                Column(
                  children: [
                    Builder(builder: (context) {
                      return Consumer<ProductCarouselViewModel>(
                        builder: (context, state, _) {
                          return Stack(
                            children: [
                              // Carousel
                              CarouselSlider(
                                carouselController: state.carouselController,
                                options: CarouselOptions(
                                  height: 214.0,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    state.currentIndex = index;
                                  },
                                ),
                                items: state.product!.images.map((image) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(image.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              // Indicator Carousel
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: state.product!.images.asMap().entries.map((entry) {
                                    return Container(
                                      width: 10,
                                      height: 10,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                        horizontal: 4.0,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: entry.key == state.currentIndex ? warning20 : neutral20
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: semiBoldBody3,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Text(
                                  snapshot.data!.formattedPrice,
                                  style: semiBoldBody5,
                                ),
                                Text(
                                  ' | ${snapshot.data!.gramPlastic} gram',
                                  style: regularBody5.copyWith(color: neutral20),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(height: 3,),
                          Row(
                            children: [
                              Icon(
                                color: snapshot.data!.rating > 1 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating > 2 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating > 3 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating > 4 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating >= 5 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8,),
                          const Text(
                            "500 Terjual",
                            style: regularBody7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        "Deskripsi Produk",
                        style: semiBoldBody5.copyWith(color: primary40),
                      ),
                      const SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<ProductViewModel>(
                            builder: (context, state, _) {
                              return Text(
                                snapshot.data!.description,
                                maxLines: state.isExpanded ? 6 : 30,
                                style: regularBody7.copyWith(overflow: TextOverflow.ellipsis),
                                textAlign: TextAlign.justify,
                              );
                            }
                          ),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: snapshot.data!.description.length >= 200,
                            child: Consumer<ProductViewModel>(
                              builder: (context, state, _) {
                                return GestureDetector(
                                  onTap: () => state.isExpanded = !state.isExpanded,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        state.isExpanded ? "Selengkapnya" : "Tutup",
                                        style: mediumBody8.copyWith(color: neutral20),
                                      ),
                                      Icon(
                                        state.isExpanded
                                          ? Icons.keyboard_arrow_down
                                          : Icons.keyboard_arrow_up,
                                        size: 16,
                                        color: neutral20,
                                      ),
                                    ],
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Produk Lainnya",
                        style: semiBoldBody5.copyWith(color: primary40),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        separatorBuilder: (context, index) => const SizedBox(width: 5,),
                        itemBuilder: (context, index) {
                          const product = OtherProduct();
            
                          if (index == 0) {
                            return const Row(
                              children: [
                                SizedBox(width: 20,),
                                product
                              ],
                            );
                          }
            
                          if (index == 5) {
                            return const Row(
                              children: [
                                product,
                                SizedBox(width: 20,),
                              ],
                            ); 
                          }
            
                          return product;
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ulasan',
                                style: semiBoldBody5.copyWith(color: primary40),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '100 Ulasan',
                                style: regularBody7,
                              ),
                            ],
                          ),
                          const SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Lihat Semua',
                                  style: mediumBody8,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 0.3, color: neutral10,),
                      const ProductReviewItem()
                    ],
                  ),
                )
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              padding: const EdgeInsets.all(0),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _showAddToCartDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondary00,
                        shape: const BeveledRectangleBorder(
                          side: BorderSide(color: primary40, width: 1),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/img/AddToCartIcon.svg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary40,
                        shape: const BeveledRectangleBorder(),
                      ),
                      child: const Text(
                        'Beli Sekarang',
                        style: semiBoldBody6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: primary40,
                strokeWidth: 3,
              ),
            ),
          ),
        );
      }
    );
  }
}
