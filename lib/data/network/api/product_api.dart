import 'package:dio/dio.dart';

import '../../../core/constants/url_constants.dart';
import '../service/api_service.dart';

class ProductApi {
  final ApiService _apiService = ApiService();

  Future<Response> getProducts() async {
    try {
      final Response response = await _apiService.get(AppUrl.products);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postProduct({Map<String, dynamic>? data}) async {
    try {
      final Response response = await _apiService.post(
        AppUrl.products,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putProduct(String id, {Map<String, dynamic>? data}) async {
    try {
      final Response response = await _apiService.put(
        '${AppUrl.products}/$id',
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> deleteProduct(String id) async {
    try {
      final Response response = await _apiService.delete(
        '${AppUrl.products}/$id',
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
