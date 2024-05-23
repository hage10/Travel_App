import 'dart:async';
import '../service/auth_service.dart';

class LoginBloc {
  final AuthService authService;

  final _loginController = StreamController<dynamic>();
  Stream<dynamic> get loginStream => _loginController.stream;

  LoginBloc({required this.authService});

  Future<void> login(String email, String password) async {
    try {
      final result = await authService.login(email, password);
      _loginController.sink.add(result);
    } catch (e) {
      if (e is Exception) {
        _loginController.sink.addError(e);
      } else {
        _loginController.sink.addError(Exception(e.toString()));
      }
    }
  }

  void dispose() {
    _loginController.close();
  }
}
