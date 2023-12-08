import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class UseCouponScreen extends StatefulWidget {
  static const String routePath = '/use-coupon-screen';
  const UseCouponScreen({super.key});

  @override
  State<UseCouponScreen> createState() => _UseCouponScreenState();
}

class _UseCouponScreenState extends State<UseCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kupon'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 26),
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(primary30),
            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 41)),
          ),
          child: const Text(
            'Pakai Kupon',
            style: semiBoldBody6,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        itemCount: 9,
        separatorBuilder: (context, index) => const SizedBox(height: 15,),
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: blackColor,
              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(right: BorderSide(width: 1, color: blackColor)),
                          color: primary40
                        ),
                        child: Image.asset(
                          'assets/img/Coupon.png',
                          height: double.infinity,
                          width: 113,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: warning30,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(4),
                            bottomEnd: Radius.circular(8)
                          )
                        ),
                        child: Text(
                          'Gold',
                          style: semiBoldBody8.copyWith(color: whiteColor)
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10,),
                const Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kupon Potongan Harga Rp5.000',
                        style: mediumBody7,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Min. Blj Rp30.000',
                        style: mediumBody8,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Berakhir dalam : 5 Nov 23',
                        style: regularBody8,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Radio(
                    value: index,
                    groupValue: 2,
                    onChanged: (value) {
                      
                    },
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
