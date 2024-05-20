String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required!';
  }

  // Kiểm tra định dạng email bằng biểu thức chính quy
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (!emailRegExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required!';
  }

  // Biểu thức chính quy kiểm tra định dạng số điện thoại
  final phoneNumberRegExp = RegExp(r'^(?:\+?88|0088)?01[13-9]\d{8}$');
  if (!phoneNumberRegExp.hasMatch(value)) {
    return 'Please enter a valid phone number';
  }

  return null;
}

String? validateRequiredField(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName is required!';
  }
  return null;
}
