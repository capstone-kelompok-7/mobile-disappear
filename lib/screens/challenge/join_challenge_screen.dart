import 'package:disappear/screens/challenge/components/join_challenge_success_dialog.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
          icon: const Icon(Icons.arrow_back_ios),
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
            return ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  'Formulir bukti mengikuti',
                  style: semiBoldBody4,
                ),

                const SizedBox(height: 30),

                const Text(
                  'Username',
                  style: mediumBody5,
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
                    hintText: 'Cth : ayudimas123',
                    hintStyle: regularBody7,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: const EdgeInsets.only(left: 10),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),

                const SizedBox(height: 15),

                const Text(
                  'Bukti',
                  style: mediumBody5,
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
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(bottom: 5, top: 5)),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(1, 1),
                              ),
                              fixedSize: MaterialStateProperty.all<Size>(
                                const Size(
                                    65, 20), 
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
                   
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Tidak ada gambar yang dipilih',
                      hintStyle: mediumBody8),
                ),

                const SizedBox(height: 5),

                Text(
                  '*maksimal 2MB dengan format PNG, JPG, JPEG',
                  style: regularBody8.copyWith(color: (state.fileSizeInMb ?? 0) > 2 ? error30 : neutral30)
                ),

                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: primary40, width: 1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        padding: const EdgeInsets.all(5),
                        minimumSize: const Size(60, 30),
                        backgroundColor: whiteColor,
                        foregroundColor: primary40,
                      ),
                      child: const Text('Batal', style: semiBoldBody6),
                    ),
                    const SizedBox(width: 10,),
                    ElevatedButton(
                      onPressed: !state.isLoadingSubmitChallenge ?
                        () async {
                          if (formkey.currentState!.validate()) {
                            final int id = arguments as int;
                            final String username = usernameController.text;
                            final String filePath = fileController.text;

                            final response = await state.postChallenge(id, username, filePath);

                            if (response == true) {
                              // ignore: use_build_context_synchronously
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const JoinChallengeSuccessDialog()
                              );
                            }
                          }
                        }
                        : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        padding: const EdgeInsets.all(5),
                        minimumSize: const Size(60, 30),
                      ),
                      child: Builder(
                        builder: (context) {
                          if (state.isLoadingSubmitChallenge) {
                            return const SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 3,
                              ),
                            );
                          }

                          return const Text('Kirim', style: semiBoldBody6);
                        }
                      ),
                    ),
                  ],
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
          padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
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

  void _pickFile() async {
    final ChallengeMainViewModel viewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    
    if (result != null) {
      final int sizeInBytes = result.files.single.size;
      viewModel.fileSizeInMb = sizeInBytes / (1024 * 1024);

      if (viewModel.fileSizeInMb! <= 2) {
        String filePath = result.files.single.path ?? ''; // Get the file path
        viewModel.filePath = filePath;
        fileController.text = filePath;
      }
    }
  } 
}
