import 'package:flutter/material.dart';

class ProductReviewItem extends StatefulWidget {
  const ProductReviewItem({super.key});

  @override
  State<ProductReviewItem> createState() => _ProductReviewItemState();
}

class _ProductReviewItemState extends State<ProductReviewItem> {
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