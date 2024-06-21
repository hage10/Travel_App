import 'package:dio/dio.dart';
import '../../../core/helpers/local_storage_helper.dart';
import '../api/auth_api.dart';

class AuthService {
  final AuthRepository authRepository;

  AuthService({required this.authRepository});

  Future<dynamic> login(String email, String password) async {
    try {
      final result = await authRepository.login(email, password);
      if (result.statusCode == 200) {
        LocalStorageHelper.setValue("email", email);
        LocalStorageHelper.setValue("password", password);
        return true;
      } else {
        return result.data['error'] ?? result.statusMessage;
      }
    } on DioException catch (e) {
      return e.response?.data['error'] ?? 'Unknown error';
    } catch (e) {
      return 'Unexpected error occurred';
    }
  }
}
