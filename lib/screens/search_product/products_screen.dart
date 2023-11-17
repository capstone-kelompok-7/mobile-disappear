import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  static const String routePath = '/search-products';

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  void _showFilterBottomDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1A000000),
                          blurRadius: 4,
                          offset: Offset(0, 4)
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Clear'),
                        const Text('Urutkan berdasarkan'),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.clear)
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 41,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 54),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                    ),
                    child: const Center(
                      child: Text('Abjad', style: TextStyle(color: Colors.white, fontSize: 14),)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 54),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1)
                    ),
                    child: const Center(
                      child: Text('Terbaru', style: TextStyle(color: Colors.black, fontSize: 14),)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 54),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1)
                    ),
                    child: const Center(
                      child: Text('Termahal', style: TextStyle(color: Colors.black, fontSize: 14),)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 54),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 1)
                    ),
                    child: const Center(
                      child: Text('Termurah', style: TextStyle(color: Colors.black, fontSize: 14),)
                    ),
                  ),
                  const SizedBox(height: 41,),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

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
                GestureDetector(
                  onTap: _showFilterBottomDialog,
                  child: Container(
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