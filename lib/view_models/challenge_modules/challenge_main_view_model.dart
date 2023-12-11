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
import 'package:flutter_svg/svg.dart';

class ChallengeMainViewModel extends ChangeNotifier {
  int? challengeId;
  int selectedTabChallenge = 1;

  String? message;
  set errorMessage(String? errorMessage) {
    message = errorMessage;
    notifyListeners();
  }

  String? get errorMessage => message;

  int? _isLoadingVoucherClaim;
  int? get isLoadingVoucherClaim => _isLoadingVoucherClaim;


  //VARIABEL POSTFILE KE SERVER IKUT TANTANGAN
  String? filePath;

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

//Challenge Viewmodel FEATURE//
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

  Future postChallenge(int id, String username, String filePath) async {
    
    try {
      final postChallengeService = ChallengeService();
      return await postChallengeService.postSubmitChallenge(id, username, filePath);
    } catch (e) {
      rethrow;
    }
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
    _isLoadingVoucherClaim = id;
    notifyListeners();

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
    } finally {
      _isLoadingVoucherClaim = null;
      notifyListeners();
    }
  }


// void _showDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           contentPadding: EdgeInsets.zero,
//           title: const Column(
//             children: [
//               Icon(
//                 Icons.check_circle_outline_outlined,
//                 size: 40,
//               ),
//               SizedBox(height: 14),
//               Text(
//                 'Sukses',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     decoration: TextDecoration.underline,
//                     decorationThickness: 1,
//                     decorationStyle: TextDecorationStyle.solid),
//               ),
//               SizedBox(height: 15.5),
//             ],
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 42.5),
//                 child: Text(
//                   'Data mu sudah kami simpan. Terima kasih sudah mengikuti tantangan ini !',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 24.5, bottom: 4, left: 42.5, right: 42.5),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Home'),
//                 ),
//               ),
//               SvgPicture.asset(
//                 "assets/img/alertDialogComponent.svg",
//                 fit: BoxFit.fill,
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }


}
