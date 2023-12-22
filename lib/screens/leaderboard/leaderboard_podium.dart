import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LeaderboardPodium extends StatefulWidget {
  final List<Leaderboard> leaderboard;

  const LeaderboardPodium({super.key, required this.leaderboard});

  @override
  State<LeaderboardPodium> createState() => _LeaderboardPodiumState();
}

class _LeaderboardPodiumState extends State<LeaderboardPodium> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 2ND JUARA 2///
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(
                  0xffd9d9d9,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.leaderboard.first.photoProfile.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.leaderboard[1].name.toString(),
              style: regularBody7,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              width: 70,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(250, 213, 133, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '2 nd',
                    style: semiBoldBody3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${widget.leaderboard[1].exp.toString()} EXP',
                    style: regularBody8,
                  ),
                ],
              ),
            ),
          ],
        ),
        
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(
                  0xffd9d9d9,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.leaderboard.first.photoProfile.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.leaderboard.first.name.toString(),
              style: regularBody7,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 70,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(205, 255, 204, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '1 st',
                    style: semiBoldBody3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${widget.leaderboard.first.exp.toString()} EXP',
                    style: regularBody8,
                  ),
                ],
              ),
            ),
          ],
        ),
        
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(
                  0xffd9d9d9,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.leaderboard[2].photoProfile.toString(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.leaderboard[2].name.toString(),
              style: regularBody7,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 90,
              width: 70,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 204, 204, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '3 rd',
                    style: semiBoldBody3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${widget.leaderboard[2].exp} EXP',
                    style: regularBody8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}