import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:travel_app/data/models/product.dart';

import '../../../data/network/api/product_api.dart';
import '../../../data/network/service/api_exception.dart';

class BookingController extends GetxController with StateMixin<List<Product>> {
  final ProductApi _productApi = ProductApi();

  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final response = await _productApi.getProducts();
      if (response.statusCode == 200) {
        final productModel = ProductModel.fromJson(response.data);
        if (productModel.products != null) {
          products.assignAll(productModel.products!);
          change(products, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('No products found'));
        }
      }
    } on DioExceptionType catch (e) {
      final ApiException apiException = ApiException.fromDioError(e);
      change(null, status: RxStatus.error(apiException.toString()));
    }
  }
}
