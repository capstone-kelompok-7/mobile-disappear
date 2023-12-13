import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:disappear/themes/text_theme.dart';

class JoinChallengeScreen extends StatefulWidget {
  static const String routePath = '/join-challenge-screen';
  const JoinChallengeScreen({super.key});

  @override
  State<JoinChallengeScreen> createState() => _JoinChallengeScreenState();
}

class _JoinChallengeScreenState extends State<JoinChallengeScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController fileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: primary40,
        title: Text('Ikuti Tantangan',
            style: semiBoldBody1.copyWith(color: Colors.white)),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(left: 48, top: 50, right: 47.5),
          child: Consumer<ChallengeMainViewModel>(builder: (context, state, _) {
            return Column(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan username instagram anda',
                    hintStyle: GoogleFonts.inter().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Bukti',
                  style: GoogleFonts.inter().copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: fileController,
                  readOnly: true,
                  decoration: InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(bottom: 5, top: 5)),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(1, 1),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(
                                    65, 20), // Set width and height as needed
                              ),
                            ),
                            onPressed: () {
                              _pickFile();
                            },
                            child:
                                const Text('Pilih Berkas', style: mediumBody8)),
                      ),
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 10),
                      // border: Border(
                      //   top: BorderSide(color: Colors.black)
                      // ),
                      // enabledBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       color: Colors.black), // Set no borders by default
                      //   borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(5), // Border only for top left
                      //     bottomRight:
                      //         Radius.circular(5), // Border only for bottom right
                      //   ),
                      // ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Tidak ada gambar yang dipilih',
                      hintStyle: mediumBody8),
                ),
                SizedBox(
                  height: 20,
                ),

                // Row(
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(
                //         borderRadius:
                //             const BorderRadius.all(Radius.circular(5)),
                //         border: Border(
                //           left: BorderSide(
                //               width: 1.0,
                //               color: Colors.black), // Border for the left side
                //           top: BorderSide(
                //               width: 1.0,
                //               color: Colors.black), // No border for the top
                //           right: BorderSide.none, // No border for the right
                //           bottom: BorderSide(
                //               width: 1.0,
                //               color: Colors.black), // Border for the bottom
                //         ),
                //       ),
                //       child: filePicker(context),
                //     ),
                //     Expanded(
                //       child: TextFormField(
                //         validator: (value) {
                //           if (value == null || value.isEmpty) {
                //             return 'Field tidak boleh kosong';
                //           }
                //           return null;
                //         },
                //         controller: fileController,
                //         readOnly: true,
                //         decoration: InputDecoration(
                //           contentPadding: EdgeInsets.all(8),
                //           // border: Border(
                //           //   top: BorderSide(color: Colors.black)
                //           // ),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color:
                //                     Colors.black), // Set no borders by default
                //             borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(
                //                   5), // Border only for top left
                //               bottomRight: Radius.circular(
                //                   5), // Border only for bottom right
                //             ),
                //           ),
                //           fillColor: Colors.amber,
                //           filled: true,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 230),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        final int id = arguments as int;
                        final String username = usernameController.text;
                        final String filePath = fileController.text;
                        state.postChallenge(id, username, filePath);
                        Navigator.of(context).pop();
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(5)),
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(60, 30),
                      ),
                    ),
                    child: Text('Kirim', style: semiBoldBody6),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget filePicker(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(5)),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(20, 20),
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

  // void _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result != null) {}

  //   // _openFile(file);
  // }

  void _pickFile() async {
    final ChallengeMainViewModel viewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);

    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String filePath = result.files.single.path ?? ''; // Get the file path
      viewModel.filePath = filePath;
      fileController.text = filePath;
    }
  }

  // void _openFile(PlatformFile file) {
  //   OpenFile.open(file.path);
  //   debugPrint(file.path);
  // }
}
