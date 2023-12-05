import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/services/challenge_service.dart';
import 'package:disappear/services/leaderboard_service.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ChallengeMainViewModel extends ChangeNotifier {
  int selectedTabChallenge = 1;

  Widget topButton() {
    return Container(
      margin: const EdgeInsets.only(
        left: 75,
        right: 75,
        top: 16,
        bottom: 37,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      width: 250,
      height: 30,
      decoration: const BoxDecoration(
        color: primary40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              selectedTabChallenge = 1;
              notifyListeners();
            },
            child: Container(
              width: 70,
              height: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 2,
              ),
              decoration: selectedTabChallenge == 1
                  ? const BoxDecoration(
                      color: secondary00,
                    )
                  : null,
              child: const Text('Tantangan', style: semiBoldBody8),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              selectedTabChallenge = 2;
              notifyListeners();
            },
            child: Container(
              width: 80,
              height: 20,
              padding: const EdgeInsets.only(
                left: 8,
                top: 2,
                bottom: 2,
              ),
              decoration: selectedTabChallenge == 2
                  ? const BoxDecoration(
                      color: secondary00,
                    )
                  : null,
              child: const Text('Leaderboard', style: semiBoldBody8),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              selectedTabChallenge = 3;
              notifyListeners();
            },
            child: Container(
              width: 70,
              height: 20,
              padding: const EdgeInsets.only(left: 14, top: 2),
              decoration: selectedTabChallenge == 3
                  ? const BoxDecoration(
                      color: secondary00,
                    )
                  : null,
              child: const Text(
                'Kuponku',
                style: semiBoldBody8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<ChallengesModel>> fetchAllChallenge() async {
    try {
      final challengeService = ChallengeService();
      return await challengeService.fetchAllChallenge();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<LeaderboardModel>> fetchLeaderboard() async {
    try {
      final leaderboardService = LeaderboardService();
      return await leaderboardService.fetchLeaderboard();
    } catch (e) {
      rethrow;
    }
  }
}
