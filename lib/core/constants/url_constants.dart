class AppUrl {
  AppUrl._();

  // base url
  static const String baseUrl = "https://reqres.in/api";

  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static const String login = '/login';
  static const String users = '/users';
  static const String products = '/products';
}
