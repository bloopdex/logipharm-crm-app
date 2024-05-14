import 'package:dio/dio.dart';

import '../../../logic/file/file_cubit.dart';
import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class HireRepository {
  static Future<Response> create({required Map<String, dynamic> data}) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.postData(
      url: '/recrutement/',
      token: token,
      data: data,
    );
  }

  static Future<Response> get({
    required int page,
    required int size,
    required String startDate,
    required String endDate,
    required String query,
  }) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.getData(
      url: '/recrutement/',
      token: token,
      query: {
        "dateDebut": startDate,
        "dateFin": endDate,
        "region": query,
        "page": page,
        "pageSize": size,
      },
    );
  }

  static Future<Response> file({required String hireId, required FileModel file}) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.uploadImage(
      file.url,
      '/file/upload?id=$hireId&typeAttachment=2',
      token,
    );
  }
}
