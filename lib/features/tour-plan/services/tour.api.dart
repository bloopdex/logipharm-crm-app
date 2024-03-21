import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class TourApi {
  static Future<Response> get({
    required int page,
    required int size,
    required String start,
    required String end,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/tournee/',
      token: token,
      query: {
        "dateDebut": start,
        "dateFin": end,
        'page': page,
        'pageSize': size,
      },
    );
  }
}
