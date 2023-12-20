import 'package:disappear/helper.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/screens/challenge/detail_challenge_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChallengeComponents extends StatefulWidget {
  final ChallengesModel challengesModel;
  const ChallengeComponents({super.key, required this.challengesModel});

  @override
  State<ChallengeComponents> createState() => _ChallengeComponentsState();
}

class _ChallengeComponentsState extends State<ChallengeComponents> {
  void _goToDetailChallengeScreen(int challengeId) {
    final detailChallengeViewModel =
        Provider.of<ChallengeMainViewModel>(context, listen: false);
    detailChallengeViewModel.challengeId = challengeId;

    Navigator.pushNamed(context, DetailChallengeScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _goToDetailChallengeScreen(widget.challengesModel.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
                      FittedBox(
                        child: Text(
                          'Tantangan berlaku sampai ${formattedDate(widget.challengesModel.endDate, format: 'd-MM-yyyy')}',
                          style: regularBody7,
                        ),
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
      ),
    );
  }
}
