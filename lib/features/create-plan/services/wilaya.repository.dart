import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class WilayaRepository {
  static Future<Response> get() async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/wilaya/',
      token: token,
    );
  }
}
