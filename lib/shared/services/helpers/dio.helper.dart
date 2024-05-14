import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../../core/const.dart';

class DioHelper {
  static late Dio dio;
  static CancelToken cancelToken = CancelToken();

  static Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: '$HTTP$baseUrl:$port$version',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
        validateStatus: (_) => true,
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      ),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).validateCertificate =
        (certificate, host, port) => true;
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    Map<String, dynamic> header = {
      'Authorization': token,
    };
    if (headers != null) {
      header.addAll(headers);
    }
    return await dio.get(url,
        queryParameters: query,
        cancelToken: cancelToken,
        options: Options(
          headers: header,
        ));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    Map<String, dynamic> header = {
      'Authorization': token,
    };
    if (headers != null) {
      header.addAll(headers);
    }
    return await dio.post(url,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
        options: Options(
          headers: header,
        ));
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    Map<String, dynamic> header = {
      'Authorization': token,
    };
    if (headers != null) {
      header.addAll(headers);
    }
    return await dio.put(url,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
        options: Options(
          headers: header,
        ));
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    Map<String, dynamic> header = {
      'Authorization': token,
    };
    if (headers != null) {
      header.addAll(headers);
    }
    return await dio.patch(url,
        queryParameters: query,
        data: data,
        cancelToken: cancelToken,
        options: Options(
          headers: header,
        ));
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    Map<String, dynamic> header = {
      'Authorization': token,
    };
    if (headers != null) {
      header.addAll(headers);
    }
    return await dio.delete(
      url,
      queryParameters: query,
      data: data,
      cancelToken: cancelToken,
      options: Options(
        headers: header,
      ),
    );
  }

  static Future<Response> uploadImage(
    String path,
    String url,
    String token, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String method = 'POST',
  }) async {
    // Create a FormData object
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(path, filename: path.split(Platform.pathSeparator).last),
      if (data != null) ...data,
    });

    // Add headers including the authorization token
    dio.options.headers.addAll({
      'Authorization': token,
      if (headers != null) ...headers,
    });

    return await dio.request(
      url,
      data: formData,
      options: Options(
        method: method,
        contentType: 'multipart/form-data',
      ),
    );
  }
}
