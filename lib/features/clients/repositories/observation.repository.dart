import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class ObservationRepository {
  static Future<Response> get({required int id}) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/observation/$id',
      token: token,
    );
  }

  static Future<Response> create({required Map<String, dynamic> data}) async {
    final token = await AuthRepository.token;

    return await DioHelper.postData(
      url: '/observation',
      data: data,
      token: token,
    );
  }
}
