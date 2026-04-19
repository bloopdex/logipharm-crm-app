import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class OrderClientRepository {
  static Future<Response> get({
    required int page,
    required int size,
    String searchTerm = '',
  }) async {
    final String token = (await AuthRepository.token) ?? '';

    return DioHelper.getData(
      url: '/orders/clients',
      query: {
        'page': page,
        'size': size,
        'searchTerm': searchTerm,
      },
      token: token,
    );
  }
}
