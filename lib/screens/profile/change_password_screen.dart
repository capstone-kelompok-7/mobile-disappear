import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/profile/change_password_view_model.dart';
import 'package:disappear/view_models/profile/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routePath = '/change_password';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isOldPasswordObscure = true;
  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangePasswordViewModel>(builder: (context, model, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: primary40,
            title: Text(
              'Ubah Kata Sandi',
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
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(28, 40, 28, 16),
              children: [
                Consumer<ProfileViewModel>(
                  builder: (context, profileViewModel, child) {
                    return Text(
                      profileViewModel.profile?.name ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 5),

                Consumer<ProfileViewModel>(
                  builder: (context, profileViewModel, _) {
                    return Text(profileViewModel.profile?.email ?? '', style: mediumBody8);
                  }
                ),

                // FutureBuilder<String?>(
                //   future: PreferencesHelper.getUserEmail(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Text(snapshot.data!, style: mediumBody8);
                //     } else {
                //       return const Text('Loading...', style: mediumBody8);
                //     }
                //   },
                // ),

                const SizedBox(height: 40),
                const Text(
                  'Kata Sandi Lama',
                  style: mediumBody6,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: isOldPasswordObscure,
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Masukkan kata sandi lama',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isOldPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isOldPasswordObscure = !isOldPasswordObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan kata sandi lama';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Kata Sandi Baru',
                  style: mediumBody6,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: isNewPasswordObscure,
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Masukkan kata sandi baru',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isNewPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isNewPasswordObscure = !isNewPasswordObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan kata sandi baru';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Masukkan kembali kata sandi baru',
                  style: mediumBody6,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: isConfirmPasswordObscure,
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Masukkan kembali kata sandi baru',
                    hintStyle: const TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordObscure
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordObscure = !isConfirmPasswordObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan kembali kata sandi baru';
                    } else if (value != newPasswordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      model.setOldPassword(oldPasswordController.text);
                      model.setNewPassword(newPasswordController.text);
                      model.setConfirmPassword(
                          confirmPasswordController.text);

                      try {
                        model.changePassword().then((_) {
                          showConfirmationDialog();
                        });
                      } catch (error) {
                        showDialogFailed();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal mengubah kata sandi'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(340, 42),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: primary30,
                  ),
                  child: const Text('Konfirmasi', style: semiBoldBody6),
                )
              ],
            ),
          ));
    });
  }

  void showConfirmationDialog() {
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
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Selamat! Kata sandi mu telah berhasil\ndiperbarui, nih. Silahkan nikmati fitur\nlainnya!!',
                    style: TextStyle(
                      color: Colors.black,
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
