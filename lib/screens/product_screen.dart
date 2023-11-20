// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, library_private_types_in_public_api, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static const String routePath = '/product-screen';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    const List<String> images = [
      "https://pbs.twimg.com/media/F-yO2jnaMAAeb3A?format=jpg&name=900x900",
      "https://pbs.twimg.com/media/F-yO2ZZaEAAUq6D?format=jpg&name=900x900",
      "https://pbs.twimg.com/media/F-8xCs_bsAAb1tG?format=jpg&name=900x900",
    ];

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 61,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: 195,
                height: 61,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _BottomSheetProduct(context);
                },
                child: Container(
                  width: 195,
                  height: 61,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Beli Sekarang",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Builder(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Builder(builder: (context) {
                      return Stack(
                        children: [
                          // Carousel
                          CarouselSlider(
                            carouselController: carouselController,
                            options: CarouselOptions(
                              height: 214.0,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: images.asMap().entries.map((entry) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(6.0),
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          entry.value,
                                        ),
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
                              children: images.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => carouselController
                                      .animateToPage(entry.key),
                                  child: Container(
                                    width: 12.0,
                                    height: 12.0,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.grey
                                              : Colors.white)
                                          .withOpacity(currentIndex == entry.key
                                              ? 0.9
                                              : 0.4),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Totebag Kanvas",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 90.0,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star_border,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      const Row(
                        children: [
                          Text(
                            "Rp 30.000",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 1.0,
                          ),
                          Text(
                            " | 20 gram",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 135.0,
                          ),
                          Text(
                            "500 Terjual",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Deskripsi Produk",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Column(
                        children: [
                          Text(
                            "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem, quas explicabo ut recusandae blanditiis quo assumenda veritatis. Impedit repudiandae tenetur corrupti, minus eos delectus accusamus non dignissimos molestias. \n \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem, quas explicabo ut recusandae blanditiis quo assumenda veritatis. Impedit repudiandae tenetur corrupti, minus eos delectus accusamus non dignissimos molestias.",
                            maxLines: isExpanded ? 6 : 30,
                            style: const TextStyle(
                              fontSize: 14.0,
                              height: 1.5,
                              overflow: TextOverflow.ellipsis,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isExpanded ? "Selengkapnya" : "Selengkapnya",
                                  style: const TextStyle(
                                    color: Colors
                                        .black, // You can customize the text color
                                  ),
                                ),
                                Icon(
                                  isExpanded
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  color: Colors
                                      .black, // You can customize the icon color
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text(
                        "Produk Lainnya",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: const [
                            OtherProduct(),
                            OtherProduct(),
                            OtherProduct(),
                            OtherProduct(),
                            OtherProduct(),
                            SizedBox(
                              width: 12,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      //Ulasan
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ulasan",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "100 Ulasan",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Text(
                                    "Lihat Semua",
                                    style: TextStyle(
                                      fontSize: 9.0,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                  child: Image.network(
                                      'https://picsum.photos/25')),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text('User 2'),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const Icon(
                                Icons.star_border,
                                size: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Barangnya buaaagusssssss, jos pokoke',
                        style: TextStyle(fontSize: 12, height: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class OtherProduct extends StatelessWidget {
  const OtherProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Image.network('https://picsum.photos/110'),
            const Padding(
              padding:
                  EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Totebag Kanvas',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_border,
                        size: 10,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Rp 20.000-',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailsModal extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final int stock;

  const ProductDetailsModal({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.stock,
  });

  @override
  Widget build(BuildContext context) {
    int quantity = 1; // Default quantity

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close_sharp,
            size: 24.0,
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Column(
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 49,
                  right: 49,
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrl,
                          width: 115,
                          height: 110,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Stock : $stock',
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 14.0,
                          ),
                          Row(
                            children: [
                              QuantityControl(quantity: quantity),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 292,
              height: 37,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {},
                child: const Text("Konfirmasi"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class QuantityControl extends StatefulWidget {
  final int quantity;

  const QuantityControl({super.key, required this.quantity});

  @override
  _QuantityControlState createState() => _QuantityControlState();
}

class _QuantityControlState extends State<QuantityControl> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 115,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              if (quantity > 1) {
                setState(() {
                  quantity--;
                });
              }
            },
            icon: const Icon(
              Icons.remove,
              size: 14,
            ),
          ),
          Text(
            '$quantity',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
            icon: const Icon(
              Icons.add,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}

void _BottomSheetProduct(BuildContext context) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    context: context,
    builder: (BuildContext builder) {
      return const SizedBox(
        width: 390,
        height: 250,
        child: ProductDetailsModal(
          productName: 'Totebag Kanvas',
          imageUrl:
              'https://pbs.twimg.com/media/F-yO2jnaMAAeb3A?format=jpg&name=900x900',
          stock: 200,
        ),
      );
    },
  );
}
