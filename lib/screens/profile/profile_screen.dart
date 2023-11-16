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
      body: Column(
        children: [
          //WIDGET PROFILE
          Padding(
            padding: const EdgeInsets.only(
                left: 31, right: 41, top: 18.5, bottom: 15),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 43,
                ),
                const SizedBox(
                  width: 8,
                ),
                SizedBox(
                  width: 148,
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dimas Bayuwangis',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'dimasbayuwangis05@gmail.com',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          '0848-7965-7909',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset('assets/img/profileTier.svg')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 60,
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
                          const EdgeInsets.only(right: 10, left: 10, top: 9),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/img/profileKontribusiIcon.svg'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '245 Gram',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Kontribusi',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
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
                    width: 115,
                    height: 92,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 11.5, bottom: 10, left: 10, right: 10),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                              'assets/img/profileTantanganIcon.svg'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            '25 Tantangan',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Tantangan Diikuti',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
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
            width: 339,
            height: 315,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/edit-profile-screen');
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/img/profilePersonEdit.svg'),
                        const SizedBox(
                          width: 18,
                        ),
                        const Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 192,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/img/profileTicketIcon.svg'),
                        const SizedBox(
                          width: 14,
                        ),
                        const Text(
                          'Voucher',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 206,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/img/profileArtikelIcon.svg'),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Artikel',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 215,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/img/profileDisappearPayIcon.svg',
                          fit: BoxFit.fitWidth,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'DisappearPay',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 177,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/img/profileSandiIcon.svg'),
                        const SizedBox(
                          width: 14,
                        ),
                        const Text(
                          'Ubah Kata Sandi',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 163,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    height: 25,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/img/profileLogoutIcon.svg'),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Keluar',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 214,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
