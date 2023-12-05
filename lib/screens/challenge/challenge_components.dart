import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeComponents extends StatefulWidget {
  final ChallengesModel challengesModel;
  const ChallengeComponents({super.key, required this.challengesModel});

  @override
  State<ChallengeComponents> createState() => _ChallengeComponentsState();
}

class _ChallengeComponentsState extends State<ChallengeComponents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 25,
        left: 25,
        bottom: 20,
      ),
      width: 340,
      height: 171,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            widget.challengesModel.photo.toString(),
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 72,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: const BoxDecoration(
            color: secondary00,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.challengesModel.title.toString(),
                      style: mediumBody5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Tantangan berlaku sampai  ${widget.challengesModel.formattedDate}',
                      style: regularBody7,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Text('${widget.challengesModel.exp.toString()} EXP',
                  style: semiBoldBody7),
            ],
          ),
        ),
      ),
    );
  }
}
