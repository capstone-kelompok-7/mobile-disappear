import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressListScreen extends StatefulWidget {
  static const String routePath = '/address-list-screen';
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  List<Map<String, dynamic>> daftarAlamat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alamat',
          style: semiBoldBody1,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          right: 26,
          bottom: 15,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/add-new-address-screen');
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(primary30),
            minimumSize:
                MaterialStateProperty.all(const Size(double.infinity, 41)),
          ),
          child: const Text(
            'Tambah Alamat',
            style: semiBoldBody6,
          ),
        ),
      ),
      body: Column(
        children: [
          //CONTAINER SEBUAH ALAMAT
          Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 25,
              right: 25,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: primary40),
                  borderRadius: BorderRadius.circular(5)),
            ),
            width: 340,
            height: 135,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Alamat',
                            style: semiBoldBody7,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 51,
                            height: 21,
                            decoration: ShapeDecoration(
                              color: primary40,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: const Center(
                              child: Text(
                                'Utama',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Dimas Bayuwangis',
                        style: semiBoldBody6,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '0848-7965-7909 | Jln. Merpati Blok B no.12 ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: mediumBody8,
                      ),
                      const Text(
                        'MERPATI, KOTA KAYANGAN, KAYANGAN. \nID 45362',
                        style: mediumBody8,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/edit-old-address-screen');
                    },
                    child: SvgPicture.asset(
                      'assets/img/editProfileButton.svg',
                      colorFilter:
                          const ColorFilter.mode(primary40, BlendMode.srcIn),
                    ),
                  )
                ],
              ),
            ),
          ),
          //CONTAINER SEBUAH ALAMAT
          Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 25,
              right: 25,
            ),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: primary40),
                  borderRadius: BorderRadius.circular(5)),
            ),
            width: 340,
            height: 135,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Alamat',
                            style: semiBoldBody7,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Dimas Bayuwangis',
                        style: semiBoldBody6,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '0848-7965-7909 | Jln. Merpati Blok B no.12 ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: mediumBody8,
                      ),
                      Text(
                        'MERPATI, KOTA KAYANGAN, KAYANGAN. \nID 45362',
                        style: mediumBody8,
                      )
                    ],
                  ),
                  GestureDetector(
                    child: SvgPicture.asset(
                      'assets/img/editProfileButton.svg',
                      colorFilter:
                          const ColorFilter.mode(primary40, BlendMode.srcIn),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
