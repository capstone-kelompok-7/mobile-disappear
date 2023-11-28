import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class FavoriteProductScreen extends StatefulWidget {
  static const routePath = 'favorite-product';
  const FavoriteProductScreen({super.key});

  @override
  State<FavoriteProductScreen> createState() => _FavoriteProductScreenState();
}

List<Map<String, dynamic>> product = [
  {
    'imageUrl': 'assets/img/CategoryExample.png',
    'issue': 'Tas',
  },
  {
    'imageUrl': 'assets/img/alat_makan.png',
    'issue': 'Alat makan',
  },
  {
    'imageUrl': 'assets/img/alat_minum.png',
    'issue': 'Alat minum',
  },
  {
    'imageUrl': 'assets/img/peralatan_berkebun.png',
    'issue': 'Peralatan\nberkebun',
  },
  {
    'imageUrl': 'assets/img/masker.png',
    'issue': 'Masker',
  },
  {
    'imageUrl': 'assets/img/alat_mandi.png',
    'issue': 'Alat mandi',
  },
  {
    'imageUrl': 'assets/img/aksesoris.png',
    'issue': 'Aksesoris',
  },
  {
    'imageUrl': 'assets/img/peralatan_rumah.png',
    'issue': 'Peralatan\nrumah',
  },
  {
    'imageUrl': 'assets/img/peralatan_muka.png',
    'issue': 'Peralatan\nmuka',
  },
];

class _FavoriteProductScreenState extends State<FavoriteProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary00,
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 23,
            ),
            child: Column(
              children: [
                Text(
                  'PILIHAN PRODUK',
                  style: boldBody1.copyWith(
                    color: primary40,
                  ),
                ),
                Text(
                  'Pilihlah produk kesukaan mu atau produk yang\nsering kamu gunakan',
                  style: mediumBody7.copyWith(
                    color: blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 45,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.55,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  product[index]['imageUrl'].toString(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            product[index]['issue'].toString(),
                            style: mediumBody8.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(primary30),
                    minimumSize: MaterialStatePropertyAll(
                      Size(295, 44),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Selesai',
                    style: semiBoldBody4.copyWith(
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
