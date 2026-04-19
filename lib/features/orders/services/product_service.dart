import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class ProductService {
  static Future<Response> searchProducts({
    required int page,
    required int size,
    String? query,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/stocks',
      query: {
        'query': query,
        'page': page,
        'size': size,
      },
      token: token,
    );
  }

  static Future<Response> exportProductsPdf() async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/stocks/export',
      token: token,
      headers: {
        'Accept': 'application/pdf',
      },
      responseType: ResponseType.bytes,
    );
  }
}
