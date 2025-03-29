import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class EventVisitsRepository {
  static Future<Response> getEventVisits({
    required String id,
    required int page,
    required int size,
    required String startDate,
    required String endDate,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/evenement/${id}/visite',
      token: token,
      query: {
        "startDate": startDate,
        "endDate": endDate,
        'page': page,
        'pageSize': size,
      },
    );
  }

  // Method to validate (create) an event visit
  static Future<Response> validate({required Map<String, dynamic> data}) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.postData(
      url: '/evenement/visite',
      token: token,
      data: data,
    );
  }
}
