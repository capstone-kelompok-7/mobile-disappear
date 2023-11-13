import 'dart:io';

import 'package:disappear/view_models/add_product_review_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductReviewsScreen extends StatefulWidget {
  static const String routePath = '/product-reviews';

  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  void _showAddReviewPopup() {
    showDialog(
      context: context,
      builder: (context) {
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Text('4.9', style: TextStyle(fontSize: 40),),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(width: 2,),
                    Icon(Icons.star_border, size: 23,),
                  ],
                ),
                SizedBox(height: 2,),
                Text('berdasarkan 19 ulasan', style: TextStyle(fontSize: 12),),
              ],
            ),
          ),
          const SizedBox(height: 24,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Sangat baik', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.4,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Baik', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.7,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Rata-rata', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('Buruk', style: TextStyle(fontSize: 12),)
                    ),
                    Expanded(
                      flex: 3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        value: 0.3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('13 Ulasan', style: TextStyle(fontSize: 14),),
                ElevatedButton(
                  onPressed: _showAddReviewPopup,
                  child: const Text('Tambahkan ulasan')
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
              SizedBox(height: 24,),
              ProductReview(),
              SizedBox(height: 24,),
              ProductReview(),
              SizedBox(height: 24,),
              ProductReview(),
              SizedBox(height: 24,),
              ],
            ),
          ),
        ],
      )
    );
  }
}

class ProductReview extends StatefulWidget {
  const ProductReview({super.key});

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  bool isRepondCollapsed = false;

  void _toggleRespond() => setState(() => isRepondCollapsed = !isRepondCollapsed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ClipOval(child: Image.network('https://picsum.photos/25')),
                const SizedBox(width: 8,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User 1'),
                    SizedBox(width: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border, size: 12,),
                        SizedBox(width: 2,),
                        Icon(Icons.star_border, size: 12,),
                        SizedBox(width: 2,),
                        Icon(Icons.star_border, size: 12,),
                        SizedBox(width: 2,),
                        Icon(Icons.star_border, size: 12,),
                        SizedBox(width: 2,),
                        Icon(Icons.star_border, size: 12,),
                        SizedBox(width: 8,),
                        Text('4.0'),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Text('Satu hari yang lalu', style: TextStyle(fontSize: 8),)
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network('https://picsum.photos/100/50'),
            ),
            const SizedBox(width: 8,),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network('https://picsum.photos/100/50'),
            ),
          ],
        ),
        const SizedBox(height: 12,),
        const Text(
          'Totebag kanvas ini jadi favorit sehari-hari saya. Kuat, awet, dan stylish! Bisa dipake buat belanja atau jalan-jalan. Plus, love the eco-friendly vibe! 💚🌿',
          style: TextStyle(fontSize: 12, height: 1.5),
        ),
        const SizedBox(height: 16,),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: 1, color: Colors.grey))
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _toggleRespond,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Balas ulasan', style: TextStyle(fontSize: 8),),
                        Row(
                          children: [
                            const Text('Respon', style: TextStyle(fontSize: 8),),
                            const SizedBox(width: 5,),
                            Icon(
                              isRepondCollapsed
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                              size: 16
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                  const SizedBox(height: 8,),
                  Visibility(
                    visible: isRepondCollapsed,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                        const Text(
                          'Totebag kanvas ini jadi favorit sehari-hari saya. Kuat, awet, dan stylish! Bisa dipake buat belanja atau jalan-jalan. Plus, love the eco-friendly vibe! 💚🌿',
                          style: TextStyle(fontSize: 12, height: 1.5),
                        ),
                      separatorBuilder: (context, index) => const SizedBox(height: 16,),
                      itemCount: 2
                    ),
                  ),
                ],
              )
            ),
            Visibility(
              visible: isRepondCollapsed,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(),
                    const SizedBox(height: 5,),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Balas Ulasan')
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ],
    );
  }
}

class ImagePicker extends StatefulWidget {
  const ImagePicker({ super.key });

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  String? filename;

  void _pickFile() async {
    final addProductViewModel = Provider.of<AddProductReviewViewModel>(context, listen: false);

    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      addProductViewModel.files = result.files;
    }
    
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddProductReviewViewModel>(
      builder: (context, state, _) {
        if (state.files.isEmpty) {
          return GestureDetector(
            onTap: _pickFile,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: const Icon(Icons.add_a_photo),
            )
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          itemCount: state.files.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: 100,
          ),
          itemBuilder: (context, index) {
            if (index < state.files.length) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  File(state.files[index].path!),
                  fit: BoxFit.cover,
                ),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              child: const Icon(Icons.add_a_photo),
            );
          },
        );
      }
    );
  }
}