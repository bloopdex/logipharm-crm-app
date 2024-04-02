import 'package:dio/dio.dart';

import 'tour.api.dart';

class TourRepository {
  static Future<Response> get({
    required int page,
    required int size,
    required String startDate,
    required String endDate,
    int status = -1,
    required String query,
  }) async {
    Response response = await TourApi.get(
      start: startDate,
      end: endDate,
      page: page,
      size: size,
      status: status,
      query: query,
    );

    return response;
  }

  static Future<Response> startTour({
    required String tourId,
  }) async {
    Response response = await TourApi.startTour(
      tourId: tourId,
    );

    return response;
  }
}
