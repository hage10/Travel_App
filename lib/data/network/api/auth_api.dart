import 'package:dio/dio.dart';

import '../../../core/constants/url_constants.dart';
import '../service/api_service.dart';

class AuthRepository {
  final ApiService _apiService = ApiService();
  Future<Response> login(String email, String password) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.login,
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
