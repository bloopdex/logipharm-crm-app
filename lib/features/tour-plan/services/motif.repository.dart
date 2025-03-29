import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class VisitMotifRepository {
  static Future<Response> get() async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/lov/65',
      query: {
        'active': '1',
      },
      token: token,
    );
  }
}
