import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class CommercialRegisterRepository {
  static Future<Response> get({
    required int page,
    required int size,
    String? query,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/cnrc',
      query: {
        'page': page,
        'pageSize': size,
        'value': query,
      },
      token: token,
    );
  }

  static Future<Response> update({required Map<String, dynamic> data}) async {
    final token = await AuthRepository.token;

    return await DioHelper.putData(
      token: token,
      url: '/tiers/prospect',
      data: data,
    );
  }

  static Future<Response> create({required Map<String, dynamic> data}) async {
    final token = await AuthRepository.token;

    return await DioHelper.postData(
      token: token,
      url: '/tiers/cnrc',
      data: data,
    );
  }
}
