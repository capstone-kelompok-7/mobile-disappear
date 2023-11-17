// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

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
      "https://pbs.twimg.com/media/F9uidkEbgAAWIvt?format=jpg&name=large",
      "https://ecomaniac.org/wp-content/uploads/2022/11/The-Green-Environment.jpg",
      "https://pbs.twimg.com/media/F5A9JP8WcAATr6B?format=jpg&name=900x900",
      "https://pbs.twimg.com/media/F0bo5RyWwAETV8s?format=jpg&name=large",
    ];

    return Scaffold(
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
                              height: 195.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
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
                            bottom: 16.0, // Adjust the position as needed
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
                                              ? Colors.white
                                              : Colors.black)
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
