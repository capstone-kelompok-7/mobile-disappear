import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Icon(Icons.filter_alt_outlined, size: 24,),
                ),
                const SizedBox(width: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Text('Promo', style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(width: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Row(
                    children: [
                      Text('Urutkan berdasarkan', style: TextStyle(fontSize: 20),),
                      SizedBox(width: 3,),
                      Icon(Icons.keyboard_arrow_up)
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('30 hasil yang ditemukan'),
            ),
          ],
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Image.network('https://picsum.photos/200/250'),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Totebag Kanvas', style: TextStyle(fontSize: 12),),
                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Icon(Icons.star_border, size: 10,),
                              SizedBox(width: 2,),
                              Icon(Icons.star_border, size: 10,),
                              SizedBox(width: 2,),
                              Icon(Icons.star_border, size: 10,),
                              SizedBox(width: 2,),
                              Icon(Icons.star_border, size: 10,),
                              SizedBox(width: 2,),
                              Icon(Icons.star_border, size: 10,),
                            ],
                          ),
                          SizedBox(height: 3,),
                          Text('Rp 20.000-', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}