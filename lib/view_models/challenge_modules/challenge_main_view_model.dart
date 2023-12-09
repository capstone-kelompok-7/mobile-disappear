import 'package:dio/dio.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/services/challenge_service.dart';
import 'package:disappear/services/leaderboard_service.dart';
import 'package:disappear/services/voucher_service.dart';
import 'package:disappear/themes/color_scheme.dart';
import 'package:disappear/themes/text_theme.dart';
import 'package:flutter/material.dart';

class ChallengeMainViewModel extends ChangeNotifier {
  int? challengeId;
  int selectedTabChallenge = 1;

  String? message;
  set errorMessage(String? errorMessage) {
    message = errorMessage;
    notifyListeners();
  }

  String? get errorMessage => message;

  bool _isLoadingVoucherClaim = false;
  bool get isLoadingVoucherClaim => _isLoadingVoucherClaim;

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
              width: 72,
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
              child: Text('Tantangan',
                  style: selectedTabChallenge == 1
                      ? semiBoldBody8
                      : semiBoldBody8.copyWith(color: Colors.white)),
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
              width: 85,
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
              child: Text('Leaderboard',
                  style: selectedTabChallenge == 2
                      ? semiBoldBody8
                      : semiBoldBody8.copyWith(color: Colors.white)),
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
              width: 65,
              height: 20,
              padding: const EdgeInsets.only(left: 10, top: 2),
              decoration: selectedTabChallenge == 3
                  ? const BoxDecoration(
                      color: secondary00,
                    )
                  : null,
              child: Text(
                'Kuponku',
                style: selectedTabChallenge == 3
                    ? semiBoldBody8
                    : semiBoldBody8.copyWith(color: Colors.white),
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

  Future<ChallengesModel?> getChallengeById() async {
    if (challengeId != null) {
      final challengeByIdService = ChallengeService();
      return await challengeByIdService.getChallengeById(challengeId!);
    }

    return null;
  }

//LEADERBOARD TAB FEATURE//
  Future<List<LeaderboardModel>> fetchLeaderboard() async {
    try {
      final leaderboardService = LeaderboardService();
      return await leaderboardService.fetchLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFirstPosition() async {
    try {
      final fetchFirstPlace = LeaderboardService();
      return await fetchFirstPlace.fetchFirstLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchSecondPosition() async {
    try {
      final fetchSecondPlace = LeaderboardService();
      return await fetchSecondPlace.fetchSecondLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchThirdPosition() async {
    try {
      final fetchThirdPlace = LeaderboardService();
      return await fetchThirdPlace.fetchThirdLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFourthPosition() async {
    try {
      final fetchFourthPlace = LeaderboardService();
      return await fetchFourthPlace.fetchFourthLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  Future<LeaderboardModel?> fetchFifthPosition() async {
    try {
      final fetchFifthPlace = LeaderboardService();
      return await fetchFifthPlace.fetchFifthLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

//VOUCHERS TAB FEATURE//
  Future<List<VoucherModel>> fetchVouchersToClaim() async {
    try {
      final voucherService = VoucherService();
      return await voucherService.fetchVoucherToClaim();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VoucherModel>> fetchUserVoucher() async {
    try {
      final voucherService = VoucherService();
      return await voucherService.fetchUserVoucher();
    } catch (e) {
      rethrow;
    }
  }

  Future claimVoucher(int id) async {
    try {
      final claimVoucher = VoucherService();
      return await claimVoucher.postClaimVoucher(id);
    } on DioException catch (e) {
      if (e.response != null) {
        if ([500, 501].contains(e.response!.statusCode)) {
          message = e.response!.data['message'];
        }
      }
      rethrow;
    }
  }
}
