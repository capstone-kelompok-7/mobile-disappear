import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/models/product/product_model.dart';
import 'package:disappear/screens/checkout/checkout_screen.dart';
import 'package:disappear/screens/product/components/add_to_cart_dialog.dart';
import 'package:disappear/screens/product/components/other_product.dart';
import 'package:disappear/screens/product/components/other_products_placeholder.dart';
import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:disappear/screens/product/product_reviews_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/checkout/checkout_payment_method_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_view_model.dart';
import 'package:disappear/view_models/checkout/checkout_voucher_view_model.dart';
import 'package:disappear/view_models/product/add_to_cart_view_model.dart';
import 'package:disappear/view_models/product/product_carousel_view_model.dart';
import 'package:disappear/view_models/product/product_review_view_model.dart';
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
  
  late final Future _otherProductFuture = _getOtherProduct();

  Future<Product?> _getProduct() async {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    final carouselViewModel = Provider.of<ProductCarouselViewModel>(context, listen: false);
    final reviewViewModel = Provider.of<ProductReviewViewModel>(context, listen: false);

    final product = await productViewModel.getProductById();

    carouselViewModel.product = product;
    reviewViewModel.product = product;

    return product;
  }

  Future<List<Product>> _getOtherProduct() async {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    return await productViewModel.getOtherProducts();
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

  void _purchaseNow() {
    final productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    final checkoutViewModel = Provider.of<CheckoutViewModel>(context, listen: false);

    checkoutViewModel.purchaseType = 'buy-now';
    checkoutViewModel.product = productViewModel.product;
    checkoutViewModel.selectedItems = [];

    final checkoutVoucherViewModel = Provider.of<CheckoutVoucherViewModel>(context, listen: false);
    final checkoutPaymentMethodViewModel = Provider.of<CheckoutPaymentMethodViewModel>(context, listen: false);
    
    checkoutVoucherViewModel.voucher = null;
    checkoutPaymentMethodViewModel.method = null;
    checkoutPaymentMethodViewModel.selectedMethod = null;

    Navigator.of(context).pushNamed(CheckoutScreen.routePath);
  }

  void _goToReviewScreen() {
    Navigator.of(context).pushNamed(ProductReviewsScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<AddToCartViewModel>(context, listen: false);

    final appBar = AppBar(
      backgroundColor: primary40,
      leading: IconButton(
        icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text('Detail Produk', style: semiBoldBody1.copyWith(color: whiteColor),),
      centerTitle: true,
    );

    return FutureBuilder(
      future: productFuture,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: appBar,
            body: const Center(child: Text('Produk tidak ditemukan'))
          );
        }

        if (snapshot.hasData) {
          cartViewModel.product = snapshot.data!;

          return Scaffold(
            appBar: appBar,
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
                                items: state.product!.imageUrl!.map((image) {
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
                                  children: state.product!.imageUrl!.asMap().entries.map((entry) {
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
                                color: snapshot.data!.rating >= 1 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating >= 2 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating >= 3 ? warning30 : neutral00,
                                Icons.star,
                                size: 22,
                              ),
                              const SizedBox(width: 2),
                              Icon(
                                color: snapshot.data!.rating >= 4 ? warning30 : neutral00,
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
                          Text(
                            '${snapshot.data!.totalSold} Terjual',
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
                        'Deskripsi Produk',
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
                                        state.isExpanded ? 'Selengkapnya' : 'Tutup',
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
                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Produk Lainnya',
                        style: semiBoldBody5.copyWith(color: primary40),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Consumer<ProductViewModel>(
                      builder: (context, state, _) {
                        return FutureBuilder(
                          future: _otherProductFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.isNotEmpty) {
                                return SizedBox(
                                  height: 220,
                                  child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.length,
                                    separatorBuilder: (context, index) => const SizedBox(width: 5,),
                                    itemBuilder: (context, index) {
                                      final product = OtherProduct(product: snapshot.data![index],);
                                            
                                      if (index == 0) {
                                        return Row(
                                          children: [
                                            const SizedBox(width: 20,),
                                            product
                                          ],
                                        );
                                      }
                                            
                                      if (index == snapshot.data!.length - 1) {
                                        return Row(
                                          children: [
                                            product,
                                            const SizedBox(width: 20,),
                                          ],
                                        ); 
                                      }
                                            
                                      return Row(children: [product]);
                                    },
                                  ),
                                );
                              }

                              return const Center(child: Text('Tidak ada produk'));
                            }

                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: OtherProductsPlaceholder(),
                            );
                          }
                        );
                      }
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
                              Text(
                                '${snapshot.data!.reviews.length} Ulasan',
                                style: regularBody7,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _goToReviewScreen,
                                child: const Text(
                                  'Lihat Semua',
                                  style: mediumBody8,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right,
                                size: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(thickness: 0.3, color: neutral10,),
                      Builder(
                        builder: (context) {
                          if (snapshot.data!.reviews.isNotEmpty) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ProductReviewItem(review: snapshot.data!.reviews[index]);
                              },
                              separatorBuilder: (context, index) => const SizedBox(height: 30,),
                              itemCount: snapshot.data!.reviews.length
                            );
                          }

                          return const Center(child: Text('Tidak ada review'));
                        }
                      )
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
                      onPressed: _showAddToCartDialog,
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
                    child: Consumer<ProductViewModel>(
                      builder: (context, state, _) {
                        return ElevatedButton(
                          onPressed: state.product!.stock! > 0 ? _purchaseNow : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary40,
                            shape: const BeveledRectangleBorder(),
                          ),
                          child: Text(
                            state.product!.stock! > 0 ? 'Beli Sekarang' : 'Stok habis',
                            style: semiBoldBody6,
                          ),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: primary40,
            leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
              onPressed: () => Navigator.of(context).pop(),
            ), 
            title: Text('Detail Produk', style: semiBoldBody1.copyWith(color: whiteColor),),
            centerTitle: true,
          ),
          body: const Center(
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
