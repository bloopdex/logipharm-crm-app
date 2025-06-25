import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class TurnoverRepository {
  static Future<Response> get({required int clientId, required int year}) async {
    final String? token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/turnover',
      token: token,
      query: {
        "clientId": clientId,
        "year": year,
      },
    );
  }
}
