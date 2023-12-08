import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product/product_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class ProductReviewsScreen extends StatefulWidget {
  static const String routePath = '/product-reviews';

  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  late Future _productReviewFuture;

  @override
  void initState() {
    final productReviewViewModel = Provider.of<ProductReviewViewModel>(context, listen: false);
    _productReviewFuture = productReviewViewModel.getProductReviews();

    super.initState();
  }

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
      body: FutureBuilder(
        future: _productReviewFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Consumer<ProductReviewViewModel>(
              builder: (context, state, _) {
                return ScrollEdgeListener(
                  edge: ScrollEdge.end,
                  edgeOffset: 100,
                  continuous: false,
                  debounce: const Duration(milliseconds: 500),
                  listener: state.addProductReviews,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Column(
                          children: [
                            Text('${snapshot.data.rating}', style: boldTitle4.copyWith(color: primary40),),
                            const SizedBox(height: 4,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  color: snapshot.data.rating >= 1 ? warning30 : neutral00,
                                  Icons.star,
                                  size: 28,
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  color: snapshot.data.rating >= 2 ? warning30 : neutral00,
                                  Icons.star,
                                  size: 28,
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  color: snapshot.data.rating >= 3 ? warning30 : neutral00,
                                  Icons.star,
                                  size: 28,
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  color: snapshot.data.rating >= 4 ? warning30 : neutral00,
                                  Icons.star,
                                  size: 28,
                                ),
                                const SizedBox(width: 2),
                                Icon(
                                  color: snapshot.data.rating >= 5 ? warning30 : neutral00,
                                  Icons.star,
                                  size: 28,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text('berdasarkan ${snapshot.data.reviews.length} ulasan', style: regularBody7,),
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
                                  flex: 2,
                                  child: Text('Sangat baik', style: mediumBody7,)
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    backgroundColor: neutral00,
                                    value: snapshot.data.currentRatingFive > 0
                                      ? snapshot.data.currentRatingFive / snapshot.data.totalReview
                                      : 0,
                                    valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                                  )
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text('Baik', style: mediumBody7,)
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    backgroundColor: neutral00,
                                    value: snapshot.data.currentRatingFour > 0
                                      ? snapshot.data.currentRatingFour / snapshot.data.totalReview
                                      : 0,
                                    valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text('Rata-rata', style: mediumBody7,)
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    backgroundColor: neutral00,
                                    value: snapshot.data.currentRatingThree > 0
                                      ? snapshot.data.currentRatingThree / snapshot.data.totalReview
                                      : 0,
                                    valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text('Buruk', style: mediumBody7,)
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    backgroundColor: neutral00,
                                    value: snapshot.data.currentRatingTwo > 0
                                      ? snapshot.data.currentRatingTwo / snapshot.data.totalReview
                                      : 0,
                                    valueColor: const AlwaysStoppedAnimation<Color>(warning20),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 16,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text('Sangat buruk', style: mediumBody7,)
                                ),
                                const SizedBox(width: 20,),
                                Expanded(
                                  flex: 3,
                                  child: LinearProgressIndicator(
                                    minHeight: 5,
                                    backgroundColor: neutral00,
                                    value: snapshot.data.currentRatingOne > 0
                                      ? snapshot.data.currentRatingOne / snapshot.data.totalReview
                                      : 0,
                                    valueColor: const AlwaysStoppedAnimation<Color>(warning20),
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
                        child: Text('${snapshot.data.reviews.length} Ulasan', style: mediumBody6,),
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ProductReviewItem(review: state.reviews[index]);
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 30,),
                        itemCount: state.reviews.length
                      ),
                      Visibility(
                        visible: state.isLoadingMore,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                color: primary40,
                                strokeWidth: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            );
          }

          if (snapshot.hasError) {
            return const Text('Terjadi kesalahan');
          }

          return const Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: primary40,
                strokeWidth: 3,
              ),
            ),
          );
        }
      )
    );
  }
}