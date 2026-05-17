import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class RotationRepository {
  static Future<Response> getProductRotation({
    required String startDate,
    required String endDate,
    int limit = 20,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/rotation/details',
      token: token,
      query: {
        'startDate': startDate,
        'endDate': endDate,
        'limit': limit,
      },
    );
  }
}
