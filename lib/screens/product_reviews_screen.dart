import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  static const String routePath = '/product-reviews';

  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ulasan'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            const Column(
              children: [
                Text('4.9', style: TextStyle(fontSize: 40),),
                SizedBox(height: 2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(height: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(height: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(height: 2,),
                    Icon(Icons.star_border, size: 23,),
                    SizedBox(height: 2,),
                    Icon(Icons.star_border, size: 23,),
                  ],
                ),
                SizedBox(height: 2,),
                Text('berdasarkan 19 ulasan', style: TextStyle(fontSize: 12),),
              ],
            ),
            const SizedBox(height: 24,),
            const Column(
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
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('13 Ulasan', style: TextStyle(fontSize: 14),),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Tambahkan ulasan')
                )
              ],
            ),
            const SizedBox(height: 24,),
            const ProductReview(),
            const SizedBox(height: 24,),
            const ProductReview(),
            const SizedBox(height: 24,),
            const ProductReview(),
            const SizedBox(height: 24,),
          ],
        )
      ),
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