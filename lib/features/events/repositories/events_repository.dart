import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class EventsRepository {
  static Future<Response> getEvents({
    required int page,
    required int size,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/evenement',
      token: token,
      query: {
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        'page': page,
        'pageSize': size,
      },
    );
  }
}
