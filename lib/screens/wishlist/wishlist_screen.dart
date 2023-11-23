import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  static const String routePath = '/wishlist';
  const WishListScreen({
    super.key,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  int quantity1 = 1;
  int quantity2 = 1;
  int quantity3 = 1;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 32,
        ),
        backgroundColor: primary40,
        title: Text(
          'Keranjang',
          style: semiBoldBody1.copyWith(
            color: whiteColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: neutral00,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '1 produk dipilih',
                  style: regularBody7,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: primary40,
                  ),
                ),
              ],
            ),
          ),

          /// TOTEBEG KANVAS
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              left: 23,
              right: 23,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: primary40,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected1 = !isSelected1;
                    });
                  },
                  child: isSelected1
                      ? const Icon(
                          Icons.check_box_rounded,
                          size: 25,
                          color: primary40,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: primary40,
                        ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 67,
                  height: 77,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/totebeg_kanvas.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Totebeg Kanvas',
                        style: mediumBody6,
                      ),
                      SizedBox(height: 6),
                      Text(
                        '1 Produk | 20 Gram',
                        style: regularBody8,
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Rp. 20.000',
                        style: mediumBody6,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 75,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: primary40,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity1 > 1) {
                              quantity1--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                      Text(
                        '$quantity1',
                        style: semiBoldBody6,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity1++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// TUMBLER
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              left: 23,
              right: 23,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: primary40,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected2 = !isSelected2;
                    });
                  },
                  child: isSelected2
                      ? const Icon(
                          Icons.check_box_rounded,
                          size: 25,
                          color: primary40,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: primary40,
                        ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 67,
                  height: 77,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/tumbler.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tumbler',
                        style: mediumBody6,
                      ),
                      SizedBox(height: 6),
                      Text(
                        '1 Produk | 20 Gram',
                        style: regularBody8,
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Rp. 20.000',
                        style: mediumBody6,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 75,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: primary40,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity2 > 1) {
                              quantity2--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                      Text(
                        '$quantity2',
                        style: semiBoldBody6,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity2++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// ALAT MAKAN
          Container(
            margin: const EdgeInsets.only(
              top: 25,
              left: 23,
              right: 23,
            ),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: primary40,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected3 = !isSelected3;
                    });
                  },
                  child: isSelected3
                      ? const Icon(
                          Icons.check_box_rounded,
                          size: 25,
                          color: primary40,
                        )
                      : const Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 25,
                          color: primary40,
                        ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 67,
                  height: 77,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img/alat_makan.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alat Makan',
                        style: mediumBody6,
                      ),
                      SizedBox(height: 6),
                      Text(
                        '1 Produk | 20 Gram',
                        style: regularBody8,
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Rp. 20.000',
                        style: mediumBody6,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 75,
                  margin: const EdgeInsets.only(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: primary40,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity3 > 1) {
                              quantity3--;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                      Text(
                        '$quantity3',
                        style: semiBoldBody6,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity3++;
                          });
                        },
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: primary40,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
