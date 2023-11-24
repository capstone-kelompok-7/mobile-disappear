import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  static const String routePath = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              //WIDGET PROFILE
              Padding(
                padding:
                    const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 28),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 43,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 192,
                      height: 101,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dimas Bayuwangis',
                                style: semiBoldBody7.copyWith(color: blackColor)),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('dimasbayuwangis05@gmail.com', style: mediumBody8),
                            const SizedBox(
                              height: 3,
                            ),
                            Text('0848-7965-7909', style: regularBody8.copyWith()),
                            const SizedBox(
                              height: 8,
                            ),
                            SvgPicture.asset('assets/img/profileTier.svg')
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 42,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/img/editProfileButton.svg',
                      ),
                    ),
                  ],
                ),
              ),

              //WIDGET KETERANGAN KONTRIBUSI DAN TANTANGAN

              const Divider(
                thickness: 1,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 115,
                        height: 92,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 12, left: 22, top: 6.5),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/img/profileKontribusiIcon.svg'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('245 Gram',
                                  style: boldBody6.copyWith(color: primary40)),
                              const SizedBox(height: 5),
                              const Text('Kontribusi', style: regularBody8),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 90,
                        width: 5,
                        child: VerticalDivider(
                          thickness: 2,
                        )),
                    Expanded(
                      child: SizedBox(
                        width: 121,
                        height: 92,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 10, right: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  'assets/img/profileTantanganIcon.svg'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text('25 Tantangan',
                                  style: boldBody6.copyWith(color: primary40)),
                              const SizedBox(height: 4),
                              const Text('Tantangan Diikuti', style: regularBody8),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),

              Container(
                width: 342,
                height: 377,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [

                      //EDIT PROFILE
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/edit-profile-screen');
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/profilePersonEdit.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Edit Profile', style: regularBody7),
                              const SizedBox(
                                width: 150,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 25,
                      ),


                      //ALAMAT
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 10, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/profileAlamat.svg'),
                              const SizedBox(
                                width: 13,
                              ),
                              const Text('Alamat', style: regularBody7),
                              const SizedBox(
                                width: 180,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),

                      const Divider(
                        thickness: 1,
                        height: 25,
                      ),


                      // KUPON
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/profileTicketIcon.svg'),
                              const SizedBox(
                                width: 14,
                              ),
                              const Text('Kupon', style: regularBody7),
                              const SizedBox(
                                width: 184,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 25,
                      ),

                      //ARTIKEL
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/profileArtikelIcon.svg'),
                              const SizedBox(
                                width: 17,
                              ),
                              const Text('Artikel', style: regularBody7),
                              const SizedBox(
                                width: 184,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      //DISSAPEARPAY
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/img/profileDisappearPayIcon.svg',
                              ),
                              const SizedBox(
                                width: 11,
                              ),
                              const Text('DisappearPay', style: regularBody7),
                              const SizedBox(
                                width: 138,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 25,
                      ),

                      //UBAH KATA SANDI
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/img/profileSandiIcon.svg'),
                              const SizedBox(
                                width: 16,
                              ),
                              const Text('Ubah Kata Sandi', style: regularBody7),
                              const SizedBox(
                                width: 120,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        height: 25,
                      ),


                      // KELUAR
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left : 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset('assets/img/profileLogoutIcon.svg'),
                              const SizedBox(
                                width: 19,
                              ),
                              const Text('Keluar', style: regularBody7),
                              const SizedBox(
                                width: 182,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
