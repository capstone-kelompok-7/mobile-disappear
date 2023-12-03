import 'package:disappear/screens/challenge/challenge_components.dart';
import 'package:disappear/screens/challenge/detail_challenge_screen.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LatestChallengeItem extends StatefulWidget {
  const LatestChallengeItem({super.key});

  @override
  State<LatestChallengeItem> createState() => _LatestChallengeItemState();
}

class _LatestChallengeItemState extends State<LatestChallengeItem> {
  void _goToChallengeScreen() {
    Navigator.pushNamed(context, DetailChallengeScreen.routePath);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _goToChallengeScreen,
      child: SizedBox(
        width: 130,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network('https://picsum.photos/130/80')),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                  height: 80,
                  decoration: BoxDecoration(
                      color: secondary00,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('150',
                          style: semiBoldBody3.copyWith(
                              color: neutral40, fontFamily: 'Inter')),
                      Text('EXP',
                          style: regularBody8.copyWith(
                              color: neutral40, fontFamily: 'Inter')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                'Tantangan menanam pohon',
                style: mediumBody8.copyWith(color: neutral40),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
