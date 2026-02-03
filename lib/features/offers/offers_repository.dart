import 'package:crm/shared/services/helpers/dio.helper.dart';

import 'models/offer_dto.dart';
import 'models/palier_dto.dart';
import 'models/product_dto.dart';

class OffersRepository {
  const OffersRepository();

  Future<List<OfferDto>> getOffers({
    required String authToken,
    required int companyId,
  }) async {
    final res = await DioHelper.getData(
      url: '/offers',
      token: authToken,
      query: {
        'companyId': companyId,
      },
    );

    final data = res.data;
    final list = _extractList(data);
    return list
        .map((e) => OfferDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<List<PalierDto>> getPaliers({
    required String authToken,
    required int offerId,
  }) async {
    final res = await DioHelper.getData(
      url: '/offers/$offerId/paliers',
      token: authToken,
    );

    final data = res.data;
    final list = _extractList(data);
    return list
        .map((e) => PalierDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future<List<ProductDto>> getProducts({
    required String authToken,
    required int offerId,
  }) async {
    final res = await DioHelper.getData(
      url: '/offers/$offerId/products',
      token: authToken,
    );

    final data = res.data;
    final list = _extractList(data);
    return list
        .map((e) => ProductDto.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  // Helpers
  List<dynamic> _extractList(dynamic data) {
    if (data is List) return data;
    if (data is Map<String, dynamic>) {
      final body = data['body'];
      if (body is List) return body;
      if (body is Map<String, dynamic>) {
        final content = body['content'];
        if (content is List) return content;
      }
      final content = data['content'];
      if (content is List) return content;
    }
    return [];
  }
}
