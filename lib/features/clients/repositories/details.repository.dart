import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class ClientDetailsRepository {
  static Future<Response> get({required int id}) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/fiche',
      token: token,
      query: {'clientId': id},
    );
  }
}
