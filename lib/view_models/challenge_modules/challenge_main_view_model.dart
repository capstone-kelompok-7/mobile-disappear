import 'package:dio/dio.dart';
import 'package:disappear/models/challenge_model.dart';
import 'package:disappear/models/leaderboard_model.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/screens/components/flushbar.dart';
import 'package:disappear/services/challenge_service.dart';
import 'package:disappear/services/leaderboard_service.dart';
import 'package:disappear/services/voucher_service.dart';
import 'package:flutter/material.dart';

class ChallengeMainViewModel extends ChangeNotifier {
  int? challengeId;

  int _selectedTabChallenge = 1;

  set selectedTabChallenge(int selectedTabChallenge) {
    _selectedTabChallenge = selectedTabChallenge;
    notifyListeners();
  }

  int get selectedTabChallenge => _selectedTabChallenge;

  int? _isLoadingVoucherClaim;

  int? get isLoadingVoucherClaim => _isLoadingVoucherClaim;

  bool _isLoadingSubmitChallenge = false;

  set isLoadingSubmitChallenge(bool isLoadingSubmitChallenge) {
    _isLoadingSubmitChallenge = isLoadingSubmitChallenge;
    notifyListeners();
  }

  bool get isLoadingSubmitChallenge => _isLoadingSubmitChallenge;

  //VARIABEL POSTFILE KE SERVER IKUT TANTANGAN
  String? filePath;

  double? _fileSizeInMb;

  set fileSizeInMb(double? fileSizeInMb) {
    _fileSizeInMb = fileSizeInMb;
    notifyListeners();
  }

  double? get fileSizeInMb => _fileSizeInMb;

//Challenge Viewmodel FEATURE//
  Future<List<Challenge>> fetchAllChallenge() async {
    try {
      final challengeService = ChallengeService();
      return await challengeService.fetchAllChallenge();
    } catch (e) {
      rethrow;
    }
  }

  Future<Challenge?> getChallengeById() async {
    if (challengeId != null) {
      final challengeByIdService = ChallengeService();
      return await challengeByIdService.getChallengeById(challengeId!);
    }

    return null;
  }

  Future<bool> postChallenge(int id, String username, String filePath) async {
    isLoadingSubmitChallenge = true;

    try {
      final postChallengeService = ChallengeService();
      await postChallengeService.postSubmitChallenge(id, username, filePath);

      return true;
    } on DioException catch (e) {
      if (e.response != null && [401, 403, 500].contains(e.response!.statusCode)) {
        showFailedFlushbar(message: e.response!.data['message']);
      } else {
        showFailedFlushbar(message: 'Gagal mengikuti tantangan, silakan coba lagi');
      }

      return false;
    } finally {
      isLoadingSubmitChallenge = false;
    }
  }

//LEADERBOARD TAB FEATURE//
  Future<List<Leaderboard>> fetchLeaderboard() async {
    try {
      final leaderboardService = LeaderboardService();
      return await leaderboardService.fetchLeaderboard();
    } catch (e) {
      rethrow;
    }
  }

  late Future userVoucherFuture;

  late Future userVoucherToClaimFuture;

  //VOUCHERS TAB FEATURE//
  Future<List<Voucher>> fetchVouchersToClaim() async {
    try {
      final voucherService = VoucherService();
      return await voucherService.fetchVoucherToClaim();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Voucher>> fetchUserVoucher() async {
    try {
      final voucherService = VoucherService();
      return await voucherService.fetchUserVoucher();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchVouchers() async {
    userVoucherFuture = fetchUserVoucher();
    userVoucherToClaimFuture = fetchVouchersToClaim();
  }

  Future claimVoucher(int id) async {
    _isLoadingVoucherClaim = id;
    notifyListeners();

    try {
      final claimVoucher = VoucherService();
      final response = await claimVoucher.postClaimVoucher(id);

      showSuccessFlushbar(message: response['message']);
    } on DioException catch (e) {
      if (e.response != null) {
        if ([500, 501].contains(e.response!.statusCode)) {
          showFailedFlushbar(message: e.response!.data['message']);
        } else {
          showFailedFlushbar(message: 'Terjadi kesalahan pada server.');
        }
      }
    } finally {
      _isLoadingVoucherClaim = null;
      fetchVouchers();
      
      notifyListeners();
    }
  }
}
