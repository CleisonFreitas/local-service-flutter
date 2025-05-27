Map<String, dynamic> validateLoginEmailField(String value) {
  final validations = [
    [value.isEmpty, 'The email field is required'],
    [value.length < 5, 'The email field must have at least 5 characteres'],
  ];

  return _returningErrorList(validations);
}

Map<String, dynamic> validateLoginPasswordField(String value) {
  final validations = [
    [value.isEmpty, 'The password field is required'],
    [value.length < 8, 'The password must have at least 8 characteres'],
  ];

  return _returningErrorList(validations);
}

Map<String, dynamic> _returningErrorList(List<dynamic> validations) {
  final List<String> errors =
      validations
          .where((check) => check[0] == true)
          .map((check) => check[1] as String)
          .toList();

  return {
    'errors': errors,
    'firstError': errors.isNotEmpty ? errors.first : null,
  };
}
