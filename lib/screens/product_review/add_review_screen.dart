import 'package:disappear/screens/product_review/components/images_picker.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewScreen extends StatelessWidget {
  static const String routePath = '/add-review';

  const AddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary40,
          leading: IconButton(
            color: whiteColor,
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 32,
              color: whiteColor,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Nilai Produk',
            style: semiBoldBody1.copyWith(
              color: whiteColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<AddProductReviewViewModel>(
          builder: (context, state, _) {
            return Form(
              key: state.formKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(height: 30,),
                    itemCount: state.orderDetail!.orderDetails.length,
                    itemBuilder: (context, index) {
                      final orderDetail = state.orderDetail!.orderDetails[index];
              
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) {
                              if (orderDetail.product.productPhotos.isNotEmpty && orderDetail.product.productPhotos.first.url != '') {
                                return Image.network(
                                  orderDetail.product.productPhotos.first.url,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                );
                              }
              
                              return Image.asset(
                                'assets/img/totebag_kanvas.png',
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              );
                            }
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderDetail.product.name,
                                style: semiBoldBody6,
                              ),
                              const SizedBox(height: 7),
                              Text(
                                '${orderDetail.product.gramPlastic} gram',
                                style: regularBody8,
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kualitas Produk',
                        style: mediumBody5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () => state.stars = 1,
                              child: Icon(
                                Icons.star,
                                size: 32,
                                color: state.stars >= 1 ? Colors.orange : neutral00,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                              onTap: () => state.stars = 2,
                              child: Icon(
                                Icons.star,
                                size: 32,
                                color: state.stars >= 2 ? Colors.orange : neutral00,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                              onTap: () => state.stars = 3,
                              child: Icon(
                                Icons.star,
                                size: 32,
                                color: state.stars >= 3 ? Colors.orange : neutral00,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                              onTap: () => state.stars = 4,
                              child: Icon(
                                Icons.star,
                                size: 32,
                                color: state.stars >= 4 ? Colors.orange : neutral00,
                              )),
                          const SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                              onTap: () => state.stars = 5,
                              child: Icon(
                                Icons.star,
                                size: 32,
                                color: state.stars >= 5 ? Colors.orange : neutral00,
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: ImagePicker(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: state.descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Deskripsi penilaian',
                      contentPadding: EdgeInsets.all(10),
                    ),
                    maxLines: 5,
                    validator: state.validateDescription,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size(80, 30),
                              backgroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: const BorderSide(color: primary40))),
                          child: Text(
                            'Batal',
                            style: semiBoldBody7.copyWith(color: primary40),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: state.isLoading ? null : state.submitReview,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary30,
                          elevation: 0,
                          minimumSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: const BorderSide(color: primary30),
                          ),
                        ),
                        child: Builder(
                          builder: (context) {
                            if (state.isLoading) {
                              return const SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  color: whiteColor,
                                  strokeWidth: 3,
                                ),
                              );
                            }
          
                            return const Text(
                              'Nilai',
                              style: semiBoldBody7,
                            );
                          }
                        ))
                    ],
                  )
                ],
              ),
            );
          }
        ));
  }
}
