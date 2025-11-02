import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:crm/shared/services/helpers/dio.helper.dart';

import 'models/offer_dto.dart';
import 'models/palier_dto.dart';

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
    required int companyId,
    required int offerId,
  }) async {
    final res = await DioHelper.getData(
      url: '/offers/$offerId/paliers',
      token: authToken,
      query: {
        'companyId': companyId,
      },
    );

    final data = res.data;
    final list = _extractList(data);
    return list
        .map((e) => PalierDto.fromJson(Map<String, dynamic>.from(e)))
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

  // Convenience to build with stored creds when used outside DI
  static Future<(String, int)> get _creds async {
    final token = await AuthRepository.token;
    final company = await AuthRepository.companyId;
    return ((token ?? ''), (company ?? 0));
  }
}
