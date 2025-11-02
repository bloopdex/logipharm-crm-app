import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class OrderService {
  static Future<Response> getOrders({
    DateTime? from,
    DateTime? to,
  }) async {
    final token = await AuthRepository.token;

    final query = <String, dynamic>{};
    if (from != null) query['from'] = from.toIso8601String().split('T').first;
    if (to != null) query['to'] = to.toIso8601String().split('T').first;

    return await DioHelper.getData(
      url: '/orders',
      query: query,
      token: token,
    );
  }

  static Future<Response> getOrderDetails({required int orderId}) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/orders/$orderId/details',
      token: token,
    );
  }

  static Future<Response> getRealisation({int? year, int? month}) async {
    final token = await AuthRepository.token;
    final now = DateTime.now();
    final query = <String, dynamic>{
      if (year != null) 'year': year,
      if (month != null) 'month': month,
    };
    // If not provided, default to current year/month backend side or we pass explicitly
    if (year == null) query['year'] = now.year;
    if (month == null) query['month'] = now.month;

    return await DioHelper.getData(
      url: '/stats/realisation',
      query: query,
      token: token,
    );
  }
}
