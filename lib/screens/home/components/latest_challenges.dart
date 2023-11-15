import 'package:disappear/screens/home/components/latest_challenge_item.dart';
import 'package:flutter/material.dart';

class LatestChallenges extends StatelessWidget {
  const LatestChallenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Tantangan',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 16,),
        SizedBox(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: const [
              SizedBox(width: 12,),
              LatestChallengeItem(),
              SizedBox(width: 12,),
              LatestChallengeItem(),
              SizedBox(width: 12,),
              LatestChallengeItem(),
              SizedBox(width: 12,),
              LatestChallengeItem(),
              SizedBox(width: 12,),
            ],
          ),
        ),
      ],
    );
  }
}