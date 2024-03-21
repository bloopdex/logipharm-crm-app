import 'package:dio/dio.dart';

import 'tour.api.dart';

class TourRepository {
  static Future<Response> get({
    required int page,
    required int size,
    required String startDate,
    required String endDate,
  }) async {
    Response response = await TourApi.get(
      start: startDate,
      end: endDate,
      page: page,
      size: size,
    );

    return response;
  }
}
