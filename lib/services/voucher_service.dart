import 'package:dio/dio.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/services/api.dart';
import 'package:flutter/foundation.dart';

class VoucherService {
  Future<List<VoucherModel>> fetchVoucherToClaim() async {
    try {
      final dio = createDio();

      Response response = await dio.get('/vouchers/to-claims');

      List<VoucherModel> vouchersToClaim = response.data['data']
          .map<VoucherModel>(
            (data) => VoucherModel(
              id: data['id'] as int,
              name: data['name'] as String,
              code: data['code'] as String,
              category: data['category'] as String,
              description: data['description'] as String,
              discount: data['discount'] as int,
              startDate: data['start_date'] as String,
              endDate: data['end-date'] as String,
              minPurchase: data['min_purchase'] as int,
              stock: data['stock'] as int,
            ),
          )
          .toList();

      return vouchersToClaim;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VoucherModel>> fetchUserVoucher() async {
    try {
      final dio = createDio();

      Response response = await dio.get('/vouchers/users');

      // List<VoucherModel> vouchersUser = response.data['data']
      //     .map<VoucherModel>(
      //       (data) => VoucherModel(
      //         id: data['id'] as int,
      //         name: data['voucher']['name'] as String,
      //         code: data['voucher']['code'] as String,
      //         category: data['voucher']['category'] as String,
      //         description: data['voucher']['description'] as String,
      //         discount: data['voucher']['discount'] as int,
      //         startDate: data['voucher']['start_date'] as String,
      //         endDate: data['voucher']['end-date'] as String,
      //         minPurchase: data['voucher']['min_purchase'] as int,
      //       ),
      //     )
      //     .toList();

      List<VoucherModel> vouchersUser = (response.data['data'])
          .map<VoucherModel>((data) => VoucherModel(
                id: data['id'] as int,
                name: data['voucher']['name'] as String?,
                code: data['voucher']['code'] as String?,
                category: data['voucher']['category'] as String?,
                description: data['voucher']['description'] as String?,
                discount: data['voucher']['discount'] as int?,
                startDate: data['voucher']['start_date'] as String?,
                endDate: data['voucher']['end_date'] as String,
                minPurchase: data['voucher']['min_purchase'] as int?,
                // Additional fields if needed
              ))
          .toList();

      return vouchersUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postClaimVoucher(int id) async {
    final dio = createDio();

    final Response response = await dio.post('/vouchers/claims', data: {'voucher_id': id});
    return response.data;
  }
}
