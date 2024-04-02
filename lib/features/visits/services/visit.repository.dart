import 'package:dio/dio.dart';

import '../../../shared/services/helpers/dio.helper.dart';
import '../../auth/services/auth.repository.dart';

class VisitCreationRepository {
  static Future<Response> validate({required Map<String, dynamic> data}) async {
    final String token = (await AuthRepository.token) ?? "";

    return await DioHelper.postData(
      url: '/tournee/visite/',
      token: token,
      data: data,
    );
  }
}
