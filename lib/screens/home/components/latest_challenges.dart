import 'package:disappear/models/home/challenge_article.dart';
import 'package:disappear/screens/home/components/latest_challenge_item.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class LatestChallenges extends StatefulWidget {
  final List<Challenge> challenges;

  const LatestChallenges({super.key, required this.challenges});

  @override
  State<LatestChallenges> createState() => _LatestChallengesState();
}

class _LatestChallengesState extends State<LatestChallenges> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Tantangan',
            style: semiBoldBody5.copyWith(color: primary40),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 120,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final challenge = LatestChallengeItem(challenge: widget.challenges[index]);

              if (index == 0) {
                return Row(
                  children: [
                    const SizedBox(width: 10,),
                    challenge,
                  ],
                );
              }

              if (index == widget.challenges.length - 1) {
                return Row(
                  children: [
                    challenge,
                    const SizedBox(width: 10,),
                  ],
                );
              }

              return challenge;
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10,),
            itemCount: widget.challenges.length,
          ),
        ),
      ],
    );
  }
}