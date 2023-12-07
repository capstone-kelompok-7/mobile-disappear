import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/product_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductReviewsScreen extends StatefulWidget {
  static const String routePath = '/product-reviews';

  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        title: Text('Ulasan', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Consumer<ProductReviewViewModel>(
                  builder: (context, state, _) {
                    return Text('${state.product!.rating}', style: boldTitle4.copyWith(color: primary40),);
                  }
                ),
                const SizedBox(height: 4,),
                Consumer<ProductReviewViewModel>(
                  builder: (context, state, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          color: state.product!.rating >= 1 ? warning30 : neutral00,
                          Icons.star,
                          size: 28,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: state.product!.rating >= 2 ? warning30 : neutral00,
                          Icons.star,
                          size: 28,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: state.product!.rating >= 3 ? warning30 : neutral00,
                          Icons.star,
                          size: 28,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: state.product!.rating >= 4 ? warning30 : neutral00,
                          Icons.star,
                          size: 28,
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          color: state.product!.rating >= 5 ? warning30 : neutral00,
                          Icons.star,
                          size: 28,
                        ),
                      ],
                    );
                  }
                ),
                const SizedBox(height: 10,),
                Consumer<ProductReviewViewModel>(
                  builder: (context, state, _) {
                    return Text('berdasarkan ${state.product!.reviews.length} ulasan', style: TextStyle(fontSize: 12),);
                  }
                ),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Sangat baik', style: mediumBody7,)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Consumer<ProductReviewViewModel>(
                        builder: (context, state, _) {
                          return LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: neutral00,
                            value: state.product!.currentRatingFive / state.product!.totalReview!.toInt(),
                            valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                          );
                        }
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Baik', style: mediumBody7,)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Consumer<ProductReviewViewModel>(
                        builder: (context, state, _) {
                          return LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: neutral00,
                            value: state.product!.currentRatingFour / state.product!.totalReview!.toInt(),
                            valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                          );
                        }
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Rata-rata', style: mediumBody7,)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Consumer<ProductReviewViewModel>(
                        builder: (context, state, _) {
                          return LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: neutral00,
                            value: state.product!.currentRatingThree / state.product!.totalReview!.toInt(),
                            valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                          );
                        }
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Buruk', style: mediumBody7,)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Consumer<ProductReviewViewModel>(
                        builder: (context, state, _) {
                          return LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: neutral00,
                            value: state.product!.currentRatingTwo / state.product!.totalReview!.toInt(),
                            valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                          );
                        }
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Sangat buruk', style: mediumBody7,)
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Consumer<ProductReviewViewModel>(
                        builder: (context, state, _) {
                          return LinearProgressIndicator(
                            minHeight: 5,
                            backgroundColor: neutral00,
                            value: state.product!.currentRatingOne / state.product!.totalReview!.toInt(),
                            valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                          );
                        }
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Consumer<ProductReviewViewModel>(
              builder: (context, state, _) {
                return Text('${state.product!.reviews.length} Ulasan', style: mediumBody6,);
              }
            ),
          ),
          const SizedBox(height: 24,),
          Consumer<ProductReviewViewModel>(
            builder: (context, state, _) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 36),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ProductReviewItem(review: state.product!.reviews[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 30,),
                itemCount: state.product!.reviews.length
              );
            }
          ),
        ],
      )
    );
  }
}