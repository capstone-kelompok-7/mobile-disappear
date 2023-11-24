import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ElectronicWalletScreen extends StatefulWidget {
  static const String routePath = '/e-wallet';
  const ElectronicWalletScreen({super.key});

  @override
  State<ElectronicWalletScreen> createState() => _ElectronicWalletScreenState();
}

class _ElectronicWalletScreenState extends State<ElectronicWalletScreen> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Text(
          'E-Wallet',
          style: semiBoldBody1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 48,
          left: 25,
          right: 25,
          top: 31,
        ),
        child: Column(
          children: [
            /// DANA
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected1 = !isSelected1;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: neutral10,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/logo_dana.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'DANA',
                      style: mediumBody8.copyWith(
                        color: blackColor,
                      ),
                    ),
                    Spacer(),
                    isSelected1
                        ? Icon(Icons.check_rounded)
                        : Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),

            /// SHOPEEPAY
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected2 = !isSelected2;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: neutral10,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/logo_shopeepay.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'ShopeePay',
                      style: mediumBody8.copyWith(
                        color: blackColor,
                      ),
                    ),
                    Spacer(),
                    isSelected2
                        ? Icon(Icons.check_rounded)
                        : Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),

            /// OVO
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected3 = !isSelected3;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: neutral10,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/logo_ovo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'OVO',
                      style: mediumBody8.copyWith(
                        color: blackColor,
                      ),
                    ),
                    Spacer(),
                    isSelected3
                        ? Icon(Icons.check_rounded)
                        : Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),

            /// LINKAJA
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected4 = !isSelected4;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: neutral10,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 29,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/logo_link_aja.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'LinkAja',
                      style: mediumBody8.copyWith(
                        color: blackColor,
                      ),
                    ),
                    Spacer(),
                    isSelected4
                        ? Icon(Icons.check_rounded)
                        : Icon(
                            Icons.check_rounded,
                            color: whiteColor,
                          ),
                  ],
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(340, 45),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Konfirmasi',
                style: mediumBody8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
