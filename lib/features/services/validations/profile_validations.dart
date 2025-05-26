Map<String, dynamic> validateProfileNameField(String value) {
  final validations = [
    [value.isEmpty, 'The name field is required'],
    [value.length < 5, 'The profile must have at least 5 characteres'],
  ];

  return _returningErrorList(validations);
}

Map<String, dynamic> validateProfileBioField(String value) {
  final validations = [
    [value.isEmpty, 'The bio field is required'],
    [value.length < 10, 'The profile must have at least 10 characteres'],
  ];

  return _returningErrorList(validations);
}

Map<String, dynamic> validateProfileSkillsField(String value) {
  final validations = [
    [value.isEmpty, 'The skills field is required'],
    [value.length < 10, 'The profile must have at least 10 characteres'],
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
