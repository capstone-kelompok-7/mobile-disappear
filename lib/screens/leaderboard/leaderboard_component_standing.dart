import 'package:disappear/models/leaderboard_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaderboardComponentStanding extends StatefulWidget {
  final LeaderboardModel leaderboardModel;
  const LeaderboardComponentStanding(
      {super.key, required this.leaderboardModel});

  @override
  State<LeaderboardComponentStanding> createState() =>
      _LeaderboardComponentStandingState();
}

class _LeaderboardComponentStandingState
    extends State<LeaderboardComponentStanding> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 9.5,
        vertical: 5,
      ),
      child: Container(
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
            Container(
              height: 20,
              width: 10,
              child: Text(
                (() {
                  String numbers = '';
                  for (int i = 1; i <= 10; i++) {
                    numbers += '$i ';
                  }
                  return numbers;
                })(),
              ),
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
                      widget.leaderboardModel.photoProfile.toString()),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                '${widget.leaderboardModel.name.toString()}',
                style: GoogleFonts.inter().copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              '${widget.leaderboardModel.exp.toString()} EXP',
              style: GoogleFonts.inter().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
