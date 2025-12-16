import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class ClientRepository {
  static Future<Response> get({int? page, int? size}) async {
    final String token = (await AuthRepository.token) ?? "";

    Map<String, dynamic>? query;
    if (page != null && size != null) {
      query = {'page': page, 'size': size};
    }

    return await DioHelper.getData(
      url: '/tiers/pharmacie',
      query: query,
      token: token,
    );
  }
}
