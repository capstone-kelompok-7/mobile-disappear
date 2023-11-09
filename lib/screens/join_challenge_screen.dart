import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

class JoinChallengeScreen extends StatefulWidget {
  static const String routePath = '/join-challenge-screen';
  const JoinChallengeScreen({super.key});

  @override
  State<JoinChallengeScreen> createState() => _JoinChallengeScreenState();
}

class _JoinChallengeScreenState extends State<JoinChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: const Icon(Icons.arrow_back_ios),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Ikuti Tantangan',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 48, top: 50, right: 47.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Formulir bukti mengikuti',
              style: GoogleFonts.inter().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Username',
              style: GoogleFonts.inter().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Masukkan username instagram anda',
                  hintStyle: GoogleFonts.inter().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.only(left: 10)),
            ),
            const SizedBox(height: 15),
            Text(
              'Bukti',
              style: GoogleFonts.inter().copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              width: 300,
              height: 45,
              // padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  filePicker(context),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, bottom: 5),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 230),
              child: ElevatedButton(
                onPressed: () {
                  _showDialog();
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                child: Text('Kirim'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget filePicker(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(
            Size(55, 30),
          ),
        ),
        onPressed: () {
          _pickFile();
        },
        child: const Text(
          'Pilih Berkas',
          style: TextStyle(
            fontSize: 10,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
    debugPrint(file.path);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: EdgeInsets.zero,
          title: Column(
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                size: 60,
              ),
              SizedBox(height: 14),
              Text(
                'Sukses',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationStyle: TextDecorationStyle.solid),
              ),
              SizedBox(height: 15.5),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric( horizontal : 42.5),
                child: const Text(
                  'Data mu sudah kami simpan. Terima kasih sudah mengikuti tantangan ini !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.5, bottom: 14 , left: 42.5 , right: 42.5),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Home'),
                ),
              ),
        
        
              SvgPicture.asset(
                "assets/alertDialogComponent.svg",
                fit: BoxFit.fill,
              )
            ],
          ),
        );
      },
    );
  }
}
