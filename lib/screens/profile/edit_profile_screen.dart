import 'dart:io';

import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

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
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
                          child: selectedImage != null
                              ? ClipOval(
                                  child: Image.file(
                                    selectedImage!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SvgPicture.asset(
                                  'assets/img/profilePicture.svg')),
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
                  validator: (value) {
                    const String expressionEmail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    RegExp regex = RegExp(expressionEmail);
                    return !regex.hasMatch(value!)
                        ? "Masukkan Email yang valid"
                        : null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Masukkan Email Anda',
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
                    const String expressionPhoneNumber = r'^0\d{7,14}$';
                    RegExp regex = RegExp(expressionPhoneNumber);
                    return !regex.hasMatch(value!)
                        ? "Masukkan Nomor yang valid"
                        : null;
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

                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size.fromHeight(5)),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      _showDialog();
                    }
                  },
                  child: const Text(
                    'Simpan',
                    style: semiBoldBody4,
                  ),
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
          // contentPadding: EdgeInsets.zero,
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
                child: Text(
                  'Data profil mu telah berhasil diperbarui, nih. \n                Silahkan nikmati fitur lainnya!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/profile-screen');
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
}
