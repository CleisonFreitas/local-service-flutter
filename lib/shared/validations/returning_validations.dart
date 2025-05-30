Map<String, dynamic> returningErrorList(List<dynamic> validations) {
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
