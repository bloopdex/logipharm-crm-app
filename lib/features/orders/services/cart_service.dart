import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class CartService {
  static Future<Response> getCart({
    required int page,
    required int size,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.getData(
      url: '/panier',
      query: {
        'page': page,
        'size': size,
      },
      token: token,
    );
  }

  static Future<Response> addItemToCart({
    required Map<String, dynamic> data,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.postData(
      url: '/panier/add',
      data: data,
      token: token,
    );
  }

  static Future<Response> deleteItemFromCart({
    required Map<String, dynamic> data,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.deleteData(
      url: '/panier/delete',
      data: data,
      token: token,
    );
  }

  static Future<Response> validateCart({
    required Map<String, dynamic> data,
  }) async {
    final token = await AuthRepository.token;

    return await DioHelper.postData(
      url: '/panier/validate',
      data: data,
      token: token,
    );
  }
}
