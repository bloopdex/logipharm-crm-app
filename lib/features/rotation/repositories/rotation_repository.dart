import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class RotationRepository {
  static Future<Response> getProductRotation({
    required String startDate,
    required String endDate,
    int limit = 20,
    String? productName,
  }) async {
    final token = await AuthRepository.token;

    final query = {
      'startDate': startDate,
      'endDate': endDate,
      'limit': limit,
    };
    
    // Add productName to query if provided
    if (productName != null && productName.isNotEmpty) {
      query['productName'] = productName;
    }

    return await DioHelper.getData(
      url: '/rotation/details',
      token: token,
      query: query,
    );
  }
}