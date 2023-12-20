import 'package:dio/dio.dart';
import 'package:disappear/models/voucher_model.dart';
import 'package:disappear/services/api.dart';

class VoucherService {
  Future<List<Voucher>> fetchVoucherToClaim() async {
    try {
      final dio = createDio();

      Response response = await dio.get('/vouchers/to-claims');

      if (response.data['data'] != null) {
        return response.data['data']
          .map<Voucher>((data) => Voucher.fromMap(data))
          .toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Voucher>> fetchUserVoucher() async {
    try {
      final dio = createDio();

      Response response = await dio.get('/vouchers/users');

      List<Voucher> vouchersUser = (response.data['data'] ?? [])
        .map<Voucher>((data) => Voucher.fromMap(data))
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
