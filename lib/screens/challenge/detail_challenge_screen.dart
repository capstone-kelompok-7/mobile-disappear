import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailChallengeScreen extends StatefulWidget {
  static const String routePath = '/detail-tantangan-screen';
  const DetailChallengeScreen({super.key});

  @override
  State<DetailChallengeScreen> createState() => _DetailChallengeScreenState();
}

class _DetailChallengeScreenState extends State<DetailChallengeScreen> {
  bool isFinished = true;

  late final Future challengeFuture = _getChallengeId();

  Future<ChallengesModel?> _getChallengeId() async {
    final productViewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);

    final product = await productViewModel.getChallengeById();

    return product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left, size: 32, color: whiteColor,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Detail Tantangan', style: semiBoldBody1.copyWith(color: whiteColor),),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: challengeFuture,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.hasData) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 45, right: 45, top: 47, bottom: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(snapshot.data.title, style: semiBoldBody3),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Tantangan Berlaku Sampai Tanggal ${snapshot.data.formattedDate}',
                          style: regularBody8,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('${snapshot.data.exp} EXP', style: semiBoldBody8),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromRGBO(64, 64, 64, 1),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                snapshot.data.photo,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data.description,
                          style: regularBody7,
                        )
                      ],
                    ),
                  ),
                  isFinished
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 45, right: 42, bottom: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(64, 64, 64, 1),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/join-challenge-screen',
                                  arguments: snapshot.data.id);
                            },
                            child: Text(
                              'Ikuti Tantangan',
                              style: GoogleFonts.inter(),
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 10,
                        )
                ],
              );
            }
            return const Scaffold(
              body: Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: primary40,
                    strokeWidth: 3,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
