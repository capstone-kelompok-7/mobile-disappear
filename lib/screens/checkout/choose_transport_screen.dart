import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ChooseTransportScreen extends StatefulWidget {
  static const String routePath = '/choose-transport-screen';
  const ChooseTransportScreen({super.key});

  @override
  State<ChooseTransportScreen> createState() => _ChooseTransportScreenState();
}

class _ChooseTransportScreenState extends State<ChooseTransportScreen> {
  int? selectedRadioCustom;

  List<Map<String, dynamic>> transportOptions = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/9/92/New_Logo_JNE.png',
      'transportCompany': 'JNE EXPRESS REG',
      'shippingFee': '45000',
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Logo_J%26T_Merah_Square.jpg/1200px-Logo_J%26T_Merah_Square.jpg',
      'transportCompany': 'JNT EXPRESS REG',
      'shippingFee': '45000',
    },
    {
      'imageUrl':
          'https://i0.wp.com/marketing.shipper.id/wp-content/uploads/2021/10/shipper-logo-black-600px.png?fit=600%2C135&ssl=1',
      'transportCompany': 'SHIPPER',
      'shippingFee': '60000',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengiriman'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          right: 26,
          bottom: 15,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(primary30),
            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 41)),
          ),
          child: const Text(
            'Konfirmasi Jasa Pengiriman',
            style: semiBoldBody6,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18, left: 23, right: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pilih Jasa Pengiriman',
              style: mediumBody6,
            ),
            const SizedBox(
              height: 18,
            ),

            // //PILIHAN KURIR 1
            // Container(
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //     color: Colors.black,
            //   )),
            //   width: 344,
            //   height: 73,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //         Container(
            //           height: 55,
            //           width: 48,
            //           color: Colors.amber,
            //         ),
            //         SizedBox(
            //           width: 10,
            //         ),
            //         Text(
            //           'JNE Express REG',
            //           style: mediumBody7,
            //         ),
            //         SizedBox(
            //           width: 110,
            //         ),
            //         Text(
            //           'Rp. 45.000',
            //           style: mediumBody8,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: transportOptions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRadioCustom = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: selectedRadioCustom == index ? 4 : 1.2,
                        color: selectedRadioCustom == index
                            ? primary40
                            : primary10,
                      )),
                      width: 344,
                      height: 73,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 55,
                              width: 48,
                              child: Image.network(
                                '${transportOptions[index]['imageUrl']}',
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${transportOptions[index]['transportCompany']}',
                                    style: mediumBody7,
                                  ),
                                  const SizedBox(
                                    width: 105,
                                  ),
                                  Text(
                                    'Rp ${transportOptions[index]['shippingFee']}',
                                    style: mediumBody8,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
