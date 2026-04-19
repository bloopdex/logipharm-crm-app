import 'package:crm/features/auth/services/auth.repository.dart';
import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';

class ContactsRepository {
  static const String _basePath = '/contacts';

  static Future<Response> list({List<String>? categories}) async {
    final token = await AuthRepository.token;
    final Map<String, dynamic> query = {};
    if (categories != null && categories.isNotEmpty) {
      // Serialized as repeated keys by DioHelper.getData: categorie=1&categorie=2
      query['categorie'] = categories;
    }
    return await DioHelper.getData(
      url: _basePath,
      query: query,
      token: token,
    );
  }

  static Future<Response> getById(int id) async {
    final token = await AuthRepository.token;
    return await DioHelper.getData(
      url: '$_basePath/$id',
      token: token,
    );
  }

  static Future<Response> create(Map<String, dynamic> data) async {
    final token = await AuthRepository.token;
    return await DioHelper.postData(
      url: _basePath,
      data: data,
      token: token,
    );
  }

  static Future<Response> update(int id, Map<String, dynamic> data) async {
    final token = await AuthRepository.token;
    return await DioHelper.putData(
      url: '$_basePath/$id',
      data: data,
      token: token,
    );
  }

  static Future<Response> remove(int id) async {
    final token = await AuthRepository.token;
    return await DioHelper.deleteData(
      url: '$_basePath/$id',
      token: token,
    );
  }
}
