import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth.api.dart';

class AuthRepository {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<Response> login(String username, String password) async {
    Response response = await AuthApi.login(username, password);
    return response;
  }

  static Future<Response> refresh(String token) async {
    Response response = await AuthApi.refresh(token);
    return response;
  }

  static Future<Response> register(Map<String, dynamic> data) async {
    Response response = await AuthApi.register(data);
    return response;
  }

  static Future<Response> getUser(String token) async {
    Response response = await AuthApi.getUser(token);
    return response;
  }

  static Future<Response> update(Map<String, dynamic> data) async {
    Response response = await AuthApi.update(data);
    return response;
  }

  static Future<Response> company(int companyId) async {
    Response response = await AuthApi.company(companyId);
    return response;
  }

  static Future<void> setToken(String token) async {
    await _secureStorage.write(key: 'token', value: 'Bearer $token');
  }

  static Future<void> setRefreshToken(String token) async {
    await _secureStorage.write(key: 'refresh-token', value: token);
  }

  static Future<void> setFirstTime(int firstTime) async {
    await _secureStorage.write(key: 'firstTime', value: firstTime.toString());
  }

  static Future<void> setCompany(int companyId) async {
    await _secureStorage.write(key: 'companyId', value: companyId.toString());
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }

  static Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: 'refresh-token');
  }

  static Future<int> getFirstTime() async {
    String? value = await _secureStorage.read(key: 'firstTime');
    return value != null ? int.parse(value) : 1;
  }

  static Future<int?> getCompany() async {
    String? value = await _secureStorage.read(key: 'companyId');
    return value != null ? int.parse(value) : null;
  }

  static Future<void> deleteToken() async {
    await _secureStorage.delete(key: 'token');
  }

  static Future<String?> get token async => await getToken();

  static Future<String?> get refreshToken async => await getRefreshToken();

  static Future<int?> get companyId async => getCompany();

  static Future<int> get firstTime async => getFirstTime();
}
