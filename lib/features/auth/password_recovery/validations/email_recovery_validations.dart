import 'package:local_services/shared/validations/returning_validations.dart';

Map<String, dynamic> validateEmailRecoveryField(String value) {
  final validations = [
    [value.isEmpty, 'The email field is required'],
    [value.length < 5, 'The email field must have at least 5 characteres'],
  ];

  return returningErrorList(validations);
}
