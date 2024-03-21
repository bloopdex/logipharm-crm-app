import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.api.dart';

class AuthRepository {
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', 'Bearer $token');
  }

  static Future<void> setRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('refresh-token', token);
  }

  static Future<void> setFirstTime(int firstTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('firstTime', firstTime);
  }

  static Future<void> setCompany(int companyId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('companyId', companyId);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<String?> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh-token');
  }

  static Future<int> getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('firstTime') ?? 1;
  }

  static Future<int?> getCompany() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('companyId');
  }

  static Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  static Future<String?> get token async => await getToken();
  static Future<String?> get refreshToken async => await getRefreshToken();
  static Future<int?> get companyId async => getCompany();
  static Future<int> get firstTime async => getFirstTime();
}
