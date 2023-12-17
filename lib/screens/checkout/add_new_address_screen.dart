import 'package:disappear/models/address_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/address/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewAddresScreen extends StatefulWidget {
  static const String routePath = '/add-new-address-screen';
  const AddNewAddresScreen({super.key});

  @override
  State<AddNewAddresScreen> createState() => _AddNewAddresScreenState();
}

class _AddNewAddresScreenState extends State<AddNewAddresScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isMainAddress = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Tambah Alamat',
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
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 25, right: 25),
          child: ListView(
            children: [
              const Text(
                'Kontak',
                style: semiBoldBody5,
              ),

              //NAMA//
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      hintText: 'Nama Lengkap',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10)),
                ),
              ),

              //NOMOR TELEPON//
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: 'Nomor Telepon',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Alamat',
                style: semiBoldBody5,
              ),

              //NAMA JALAN , NO RUMAH//
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: addressController,
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 4,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText:
                        'Contoh : Jl. Mawar Blok K3 no. 2 CIWIDEY, KOTA BANDUNG, JAWA BARAT ID 83728',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10, top: 20),
                  ),
                ),
              ),

              //SWITCH BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Atur Sebagai Alamat Utama',
                    style: regularBody7,
                  ),
                  Switch(
                    value: isMainAddress,
                    onChanged: (bool value) {
                      setState(() {
                        isMainAddress = value;
                      });
                    },
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.grey,
                    activeTrackColor: primary10,
                    activeColor: primary40,
                  )
                ],
              ),

              //ELEVATED  BUTTON
              Padding(
                padding: const EdgeInsets.only(bottom: 46),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(primary30),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 20)),
                  ),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      final int userId = await getUserId();

                      final addressViewModel =
                          // ignore: use_build_context_synchronously
                          Provider.of<AddressViewModel>(context, listen: false);

                      final newAddress = Address(
                        id: 0,
                        userId: userId,
                        acceptedName: nameController.text,
                        phone: numberController.text,
                        address: addressController.text,
                        isPrimary: isMainAddress,
                      );

                      addressViewModel.createAddress(newAddress).then((_) {
                        _showDialogSuccess();
                      }).catchError((error) {
                        _showDialogFailed();
                      });
                    }
                  },
                  child: const Text(
                    'Simpan Alamat',
                    style: semiBoldBody6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialogSuccess() {
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
                    'Selamat! Alamat baru mu sudah\nberhasil disimpan, nih. Terima kasih\natas penambahan alamat baru mu!!',
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
                    Navigator.of(context)
                        .popAndPushNamed('/address-list-screen');
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

  void _showDialogFailed() {
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
                      child: Text(
                          'Sepertinya ada kesalahan saat proses penyimpanan perubahan alamat, nih. Periksa koneksi mu dan coba lagi yuk!!',
                          textAlign: TextAlign.center,
                          style: regularBody8),
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

Future<int> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('userId') ?? 0;
}
