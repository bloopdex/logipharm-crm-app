import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class TourApi {
  static Future<Response> get({
    required int page,
    required int size,
    required String start,
    required String end,
    required int status,
    required String query,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/tournee',
      token: token,
      query: {
        "dateDebut": start,
        "dateFin": end,
        'page': page,
        'pageSize': size,
        'status': status,
        'region': query,
      },
    );
  }

  static Future<Response> startTour({
    required String tourId,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.putData(
      url: '/tournee',
      data: {
        'tourneeId': tourId,
        'status': 1,
      },
      token: token,
    );
  }

  static Future<Response> close({
    required String tourId,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.putData(
      url: '/tournee',
      data: {
        'tourneeId': tourId,
        'status': 2,
      },
      token: token,
    );
  }
}
