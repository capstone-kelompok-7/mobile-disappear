import 'package:dio/dio.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/services/api.dart';

class VoucherService {
  Future<List<VoucherModel>> fetchVoucherToClaim() async {
    try {
      final dio = createDio();

      Response response = await dio.get('/vouchers/to-claims');

      List<VoucherModel> vouchersToClaim = response.data['data']
          .map<VoucherModel>(
            (data) => VoucherModel(
              id: data['id'],
              name: data['name'],
              code: data['code'],
              category: data['category'],
              description: data['description'],
              discount: data['discount'],
              startDate: data['start_date'],
              endDate: data['end-date'],
              minPurchase: data['min_purchase'],
              stock: data['stock'],
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

      List<VoucherModel> vouchersUser = response.data['data']
          .map<VoucherModel>(
            (data) => VoucherModel(
              id: data['id'],
              name: data['name'],
              code: data['code'],
              category: data['category'],
              description: data['description'],
              discount: data['discount'],
              startDate: data['start_date'],
              endDate: data['end-date'],
              minPurchase: data['min_purchase'],
              stock: data['stock'],
            ),
          )
          .toList();

      return vouchersUser;
    } catch (e) {
      rethrow;
    }
  }
}
