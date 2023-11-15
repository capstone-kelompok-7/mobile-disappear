import 'package:disappear/screens/product_review/components/images_picker.dart';
import 'package:disappear/view_models/product_review/add_product_review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddReviewDialog extends StatelessWidget {
  const AddReviewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Berikan nilai', style: TextStyle(fontSize: 14),),
              const SizedBox(height: 8,),
              Consumer<AddProductReviewViewModel>(
                builder: (context, state, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => state.stars = 1,
                        child: Icon(
                          state.stars >= 1 ? Icons.star : Icons.star_border,
                          size: 23,
                        )
                      ),
                      const SizedBox(width: 2,),
                      GestureDetector(
                        onTap: () => state.stars = 2,
                        child: Icon(
                          state.stars >= 2 ? Icons.star : Icons.star_border,
                          size: 23,
                        )
                      ),
                      const SizedBox(width: 2,),
                      GestureDetector(
                        onTap: () => state.stars = 3,
                        child: Icon(
                          state.stars >= 3 ? Icons.star : Icons.star_border,
                          size: 23,
                        )
                      ),
                      const SizedBox(width: 2,),
                      GestureDetector(
                        onTap: () => state.stars = 4,
                        child: Icon(
                          state.stars >= 4 ? Icons.star : Icons.star_border,
                          size: 23,
                        )
                      ),
                      const SizedBox(width: 2,),
                      GestureDetector(
                        onTap: () => state.stars = 5,
                        child: Icon(
                          state.stars >= 5 ? Icons.star : Icons.star_border,
                          size: 23,
                        )
                      ),
                    ],
                  );
                }
              ),
              const SizedBox(height: 8,),
              const Text('Klik untuk menilai', style: TextStyle(fontSize: 10),),
              const SizedBox(height: 16,),
              const Text('Tambahkan foto', style: TextStyle(fontSize: 14),),
              const SizedBox(height: 8,),
              const ImagePicker(),
              const SizedBox(height: 8,),
              const Text('Klik untuk memasukkan foto', style: TextStyle(fontSize: 10),),
              const SizedBox(height: 16,),
              const Text('Ulasan foto', style: TextStyle(fontSize: 14),),
              const SizedBox(height: 8,),
              TextFormField(),
              const SizedBox(height: 8,),
              Center(
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Kirim')
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}