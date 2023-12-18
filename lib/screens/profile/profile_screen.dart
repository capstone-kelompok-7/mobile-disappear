import 'dart:io';

import 'package:disappear/screens/address/address_list_screen.dart';
import 'package:disappear/screens/profile/edit_profile_screen.dart';
import 'package:disappear/screens/profile/placeholders/profile_placeholder.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/auth/logout_view_model.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:disappear/view_models/main_view_model.dart';
import 'package:disappear/view_models/profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  static const String routePath = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileViewModel>(context, listen: false).getProfile();
  }

  void _goToVoucherScreen() {
    final mainViewModel = Provider.of<MainViewModel>(context, listen: false);
    mainViewModel.selectedScreenIndex = 1;

    final challengeMainViewModel = Provider.of<ChallengeMainViewModel>(context, listen: false);
    challengeMainViewModel.selectedTabChallenge = 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Profile',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
          return profileViewModel.isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: categoriesPlaceholder(),
                )
              : buildProfileContent(context, profileViewModel);
        },
      ),
    );
  }

  Widget buildProfileContent(
      BuildContext context, ProfileViewModel profileViewModel) {
    final profile = profileViewModel.profile;

    return ListView(
      children: [
        //WIDGET PROFILE
        Padding(
          padding: const EdgeInsets.only(
              left: 24, right: 24, top: 10, bottom: 28),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: Builder(
                    builder: (context) {
                      if (profile != null && profile.photoProfile != '') {
                        return Image.network(
                          profile.photoProfile,
                          width: 86,
                          height: 86,
                          fit: BoxFit.cover,
                        );
                      }
                      
                      return Image.asset(
                        'assets/img/profileBackgroundImage.png',
                        width: 86,
                        height: 86,
                        fit: BoxFit.cover,
                      );
                    }
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 192,
                height: 101,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile?.name ?? '', style: semiBoldBody7.copyWith(color: blackColor)),
                      const SizedBox(height: 8),
                      Text(profile?.email ?? '', style: mediumBody8),
                      const SizedBox(height: 3),
                      Text(profile?.phone ?? '', style: regularBody8),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(38.0),
                          color: primary30,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 16.0,
                              height: 16.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.star,
                                size: 16.0,
                                color: warning30,
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 2),
                              child: Text(
                                profile?.level ?? '',
                                style: mediumBody8.copyWith(color: whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/edit-profile-screen');
                },
                child: SvgPicture.asset('assets/img/editProfileButton.svg'),
              ),
            ],
          ),
        ),

        //WIDGET KETERANGAN KONTRIBUSI DAN TANTANGAN

        const Divider(
          thickness: 0,
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
                    padding: const EdgeInsets.only(
                        right: 12, left: 22, top: 6.5),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                            'assets/img/profileKontribusiIcon.svg'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('${profile?.totalGram.toString() ?? ''} Gram',
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
                    thickness: 0,
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
                        Text(
                            '${profile?.totalChallenge.toString() ?? ''} Tantangan',
                            style: boldBody6.copyWith(color: primary40)),
                        const SizedBox(height: 4),
                        const Text('Tantangan Diikuti',
                            style: regularBody8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
        const Divider(
          thickness: 0,
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
                    Navigator.of(context).pushNamed(EditProfileScreen.routePath);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/img/profilePersonEdit.svg'),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('Edit Profile', style: regularBody7),
                        const SizedBox(
                          width: 150,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0,
                  height: 25,
                ),

                //ALAMAT
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AddressListScreen.routePath);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 15),
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
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),

                const Divider(
                  thickness: 0,
                  height: 25,
                ),

                // KUPON
                GestureDetector(
                  onTap: _goToVoucherScreen,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/img/profileTicketIcon.svg'),
                        const SizedBox(
                          width: 14,
                        ),
                        const Text('Kupon', style: regularBody7),
                        const SizedBox(
                          width: 184,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0,
                  height: 25,
                ),

                //ARTIKEL
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/article-screen');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                            'assets/img/profileArtikelIcon.svg'),
                        const SizedBox(
                          width: 17,
                        ),
                        const Text('Artikel', style: regularBody7),
                        const SizedBox(
                          width: 184,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                const Divider(
                  thickness: 0,
                  height: 25,
                ),

                //UBAH KATA SANDI
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/change_password');
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
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
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0,
                  height: 25,
                ),

                // KELUAR
                GestureDetector(
                  onTap: () {
                    final logoutViewModel = Provider.of<LogoutViewModel>(context, listen: false);

                    logoutViewModel.logout().then((value) {
                      // APLIKASI LANGSUNG KELUAR
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }

                      // TODO: PERGI KE HALAMAN LOGIN SAAT LOGOUT
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                            'assets/img/profileLogoutIcon.svg'),
                        const SizedBox(
                          width: 19,
                        ),
                        const Text('Keluar', style: regularBody7),
                        const SizedBox(
                          width: 182,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18.0,
                          color: primary40,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
