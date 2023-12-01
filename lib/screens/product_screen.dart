// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, library_private_types_in_public_api, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:disappear/screens/product_review/components/product_review_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
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
      body: ListView(
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
                              decoration: BoxDecoration(
                                color: Colors.amber,
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
                              width: 10,
                              height: 10,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: neutral20
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
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Totebag Kanvas",
                        style: semiBoldBody3,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Text(
                            "Rp 30.000",
                            style: semiBoldBody5,
                          ),
                          Text(
                            " | 20 gram",
                            style: regularBody5.copyWith(color: neutral20),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5,),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 22,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Icon(
                          Icons.star,
                          size: 22,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Icon(
                          Icons.star,
                          size: 22,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Icon(
                          Icons.star,
                          size: 22,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Icon(
                          Icons.star,
                          size: 22,
                        ),
                      ],
                    ),
                    SizedBox(height: 8,),
                    Text(
                      "500 Terjual",
                      style: regularBody7,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  "Deskripsi Produk",
                  style: semiBoldBody5.copyWith(color: primary40),
                ),
                const SizedBox(height: 5),
                Column(
                  children: [
                    Text(
                      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem, quas explicabo ut recusandae blanditiis quo assumenda veritatis. Impedit repudiandae tenetur corrupti, minus eos delectus accusamus non dignissimos molestias. \n \n Lorem ipsum dolor sit amet consectetur adipisicing elit. Doloremque sunt hic eum cumque vitae debitis, quae maxime accusantium voluptate, minima pariatur dolorem, quas explicabo ut recusandae blanditiis quo assumenda veritatis. Impedit repudiandae tenetur corrupti, minus eos delectus accusamus non dignissimos molestias.",
                      maxLines: isExpanded ? 6 : 30,
                      style: regularBody7.copyWith(overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isExpanded ? "Selengkapnya" : "Tutup",
                            style: mediumBody8.copyWith(color: neutral20),
                          ),
                          Icon(
                            isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                            size: 16,
                            color: neutral20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Produk Lainnya",
                  style: semiBoldBody5.copyWith(color: primary40),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (context, index) => const SizedBox(width: 5,),
                  itemBuilder: (context, index) {
                    const product = OtherProduct();
      
                    if (index == 0) {
                      return const Row(
                        children: [
                          SizedBox(width: 20,),
                          product
                        ],
                      );
                    }
      
                    if (index == 5) {
                      return const Row(
                        children: [
                          product,
                          SizedBox(width: 20,),
                        ],
                      ); 
                    }
      
                    return product;
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ulasan',
                          style: semiBoldBody5.copyWith(color: primary40),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '100 Ulasan',
                          style: regularBody7,
                        ),
                      ],
                    ),
                    const SizedBox(
                      child: Row(
                        children: [
                          Text(
                            'Lihat Semua',
                            style: mediumBody8,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(thickness: 0.3, color: neutral10,),
                const ProductReviewItem()
              ],
            ),
          )
        ],
      )
    );
  }
}

class OtherProduct extends StatelessWidget {
  const OtherProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 200,
      child: Card(
        color: secondary00,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              Image.network(
                'https://picsum.photos/130/120',
                fit: BoxFit.cover,
                width: 130,
                height: 120,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5, right: 6.5, bottom: 10, left: 6.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Totebag Kanvas',
                      style: mediumBody6,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3,),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                        SizedBox(width: 2,),
                        Icon(Icons.star, size: 14, color: blackColor),
                      ],
                    ),
                    SizedBox(height: 3,),
                    Text('Rp20.000-', style: semiBoldBody7),
                  ],
                ),
              )
            ],
          ),
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
