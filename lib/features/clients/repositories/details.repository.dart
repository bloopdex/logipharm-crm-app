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

  static Future<Response> changeLocation({
    required int id,
    required double lon,
    required double lat,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.putData(
      url: '/tiers/pharmacie',
      token: token,
      data: {
        'id': id,
        'latitude': lat,
        'longitude': lon,
      },
    );
  }

  static Future<Response> categories() async {
    final token = await AuthRepository.token;
    return await DioHelper.getData(
      url: '/lov/26',
      token: token,
    );
  }

  static Future<Response> updateCategory({
    required int id,
    required int categorieId,
    required String categorieLibelle,
  }) async {
    final token = await AuthRepository.token;
    return await DioHelper.putData(
      url: '/tiers/pharmacie',
      token: token,
      data: {
        'id': id,
        'categorieId': categorieId,
        'categorieLibelle': categorieLibelle,
      },
    );
  }
}
