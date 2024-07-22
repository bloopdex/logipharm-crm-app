import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class GoalRepository {
  static Future<Response> get() async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/statistque/today',
      token: token,
    );
  }
}
