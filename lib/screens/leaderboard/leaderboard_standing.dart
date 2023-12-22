import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:disappear/view_models/challenge_modules/challenge_main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderboardStanding extends StatefulWidget {
  final List<Leaderboard> leaderboard;

  const LeaderboardStanding(
      {super.key, required this.leaderboard});

  @override
  State<LeaderboardStanding> createState() =>
      _LeaderboardStandingState();
}

class _LeaderboardStandingState
    extends State<LeaderboardStanding> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChallengeMainViewModel>(builder: (context, standing, _) {
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 9.5,
          vertical: 5,
        ),
        itemCount: widget.leaderboard.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0.5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                  width: 10,
                  child: Text((index + 1).toString()),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(
                      0xffd9d9d9,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          widget.leaderboard[index].photoProfile.toString()),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('${widget.leaderboard[index].name} ', style: semiBoldBody5),
                Expanded(
                    child: Text(widget.leaderboard[index].level.toString(),
                        style: mediumBody8.copyWith(color: neutral20))),
                Text('${widget.leaderboard[index].exp} EXP', style: semiBoldBody8),
              ],
            ),
          );
        },
      );
    });
  }
}