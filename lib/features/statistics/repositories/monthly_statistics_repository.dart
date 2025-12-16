import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class MonthlyStatisticsRepository {
  static Future<Response> getMonthlyStatistics({
    DateTime? periodStart,
    DateTime? periodEnd,
  }) async {
    final token = await AuthRepository.token;

    final queryParams = <String, dynamic>{};

    if (periodStart != null) {
      queryParams['periodStart'] = DateFormat('yyyy-MM-dd').format(periodStart);
    }

    if (periodEnd != null) {
      queryParams['periodEnd'] = DateFormat('yyyy-MM-dd').format(periodEnd);
    }

    return await DioHelper.getData(
      url: '/statistque/monthly',
      query: queryParams.isNotEmpty ? queryParams : null,
      token: token,
    );
  }
}
