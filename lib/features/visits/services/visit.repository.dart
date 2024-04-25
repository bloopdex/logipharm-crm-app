import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class VisitsRepository {
  static Future<Response> validate({required Map<String, dynamic> data}) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.postData(
      url: '/tournee/visite',
      token: token,
      data: data,
    );
  }

  static Future<Response> get({
    required int page,
    required int size,
    required String startDate,
    required String endDate,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/tournee/visite',
      token: token,
      query: {
        "dateDebut": startDate,
        "dateFin": endDate,
        'page': page,
        'pageSize': size,
      },
    );
  }
}
