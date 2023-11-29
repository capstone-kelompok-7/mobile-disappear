import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditOldAddressScreen extends StatefulWidget {
  static const String routePath = '/edit-old-address-screen';
  const EditOldAddressScreen({super.key});

  @override
  State<EditOldAddressScreen> createState() => _EditOldAddressScreenState();
}

class _EditOldAddressScreenState extends State<EditOldAddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool isMainAddress = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Alamat',
          style: semiBoldBody1,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 18, left: 25, right: 25),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText:
                        'Contoh : Jl. Mawar Blok K3 no. 2 CIWIDEY, KOTA BANDUNG, JAWA BARAT ID 83728 ',
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

              //ELEVATED BUTTON SIMPAN ALAMAT
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5),
                    backgroundColor: const MaterialStatePropertyAll(primary30),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 20)),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      _showDialogSuccess();
                      Navigator.of(context)
                          .popAndPushNamed('/address-list-screen');
                    }
                  },
                  child: const Text(
                    'Simpan Alamat',
                    style: semiBoldBody6,
                  ),
                ),
              ),

              //ELEVATED BUTTON HAPUS ALAMAT
              Padding(
                padding: const EdgeInsets.only(bottom: 46),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(5),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    side: const MaterialStatePropertyAll(
                        BorderSide(color: primary40)),
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 20)),
                  ),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context)
                          .popAndPushNamed('/address-list-screen');
                    }
                  },
                  child: Text(
                    'Hapus Alamat',
                    style: semiBoldBody6.copyWith(color: primary40),
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
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline_outlined,
                      size: 50,
                      color: Color.fromRGBO(5, 229, 0, 1),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Yuhuuu!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          'Selamat! Alamatmu sudah berhasil diperbarui. Terima kasih atas pembaruan informasimu!',
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
