import 'dart:io';

import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routePath = '/edit-profile-screen';
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  File? selectedImage;

  @override
  void initState() {
    super.initState();
    final profile = context.read<ProfileViewModel>().profile;
    nameController = TextEditingController(text: profile?.name ?? '');
    numberController = TextEditingController(text: profile?.phone ?? '');
    emailController = TextEditingController(text: profile?.email ?? '');
  }

  Future pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Edit Profile',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 32,
            color: whiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.only(left: 42, right: 53),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 112.5, right: 99.5, top: 35, bottom: 28),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: selectedImage != null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(selectedImage!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Center(
                                child: SvgPicture.asset(
                                  'assets/img/profilePicture.svg',
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 10,
                        child: GestureDetector(
                          onTap: () {
                            pickImageFromGallery();
                          },
                          child: SvgPicture.asset(
                              'assets/img/editProfileCameraButton.svg'),
                        ),
                      )
                    ],
                  ),
                ),

                //FORMFIELD NAMA
                const Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Nama Anda',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10)),
                      validator: (String? value) {
                        if (value == '' || value == null) {
                          return 'Nama tidak boleh kosong';
                        }

                        if (value.trim().isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }

                        RegExp specialCharRegExp = RegExp(r'[!@#%^&*(),.?":{}|<>]');

                        if (specialCharRegExp.hasMatch(value)) {
                          return 'Nama tidak valid';
                        }

                        return null;
                      },
                ),

                const SizedBox(
                  height: 34,
                ),

                //FORMFIELD EMAIL
                const Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  enabled: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Email Anda',
                    hintStyle: mediumBody8.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: neutral20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),

                const SizedBox(
                  height: 34,
                ),

                //FORMFIELD NOMOR TELPON
                const Text(
                  'Nomor telepon',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == '' || value == null) {
                      return 'Nomor tidak boleh kosong';
                    }

                    if (value.trim().isEmpty) {
                      return 'Nomor tidak boleh kosong';
                    }

                    const String expressionPhoneNumber = r'^0\d{7,14}$';
                    RegExp regex = RegExp(expressionPhoneNumber);

                    if (!regex.hasMatch(value)) {
                      return 'Masukkan Nomor yang valid';
                    }

                    RegExp specialCharRegExp = RegExp(r'[!@#%^&*(),.?":{}|<>]');

                    if (specialCharRegExp.hasMatch(value)) {
                      return 'Masukkan nomor yang valid';
                    }

                    return null;
                  },
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Nomor Telepon Anda',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10)),
                ),

                const SizedBox(
                  height: 50,
                ),

                Consumer<ProfileViewModel>(
                  builder: (context, state, _) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primary30),
                        minimumSize:
                            MaterialStateProperty.all(const Size.fromHeight(5)),
                      ),
                      onPressed: !state.isSaving
                        ? () async {
                          if (formkey.currentState!.validate()) {
                            final data = {
                              'name': nameController.text,
                              'phone': numberController.text,
                            };
                      
                            try {
                              await context
                                  .read<ProfileViewModel>()
                                  .editProfile(data);
                              _showDialog();
                            } catch (error) {
                              showDialogFailed();
                            }
                          }
                        }
                        : null,
                      child: Builder(
                        builder: (context) {
                          if (state.isSaving) {
                            return const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 3,
                              ),
                            );
                          }
                    
                          return const Text(
                            'Edit',
                            style: semiBoldBody6,
                          );
                        }
                      ),
                    );
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: const Column(
            children: [
              Icon(Icons.check_circle_outline_outlined,
                  size: 50, color: Color.fromRGBO(5, 229, 0, 1)),
              SizedBox(height: 14),
              Text(
                'Yuhuuu!!',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 5),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Selamat! Data mu sudah berhasil\ndiperbarui, nih. Silahkan nikmati fitur\nlainnya!!",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size.fromHeight(40)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(5, 229, 0, 1)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55))),
                      elevation: MaterialStateProperty.all(6)),
                  child: const Text(
                    'Okay',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showDialogFailed() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/img/DialogFailedIcon.svg',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Ooops!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sepertinya ada kesalahan server\ninternal, nih. Atau pastikan koneksi mu\ndalam kondisi baik, ya. Coba lagi, yuk!!",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
