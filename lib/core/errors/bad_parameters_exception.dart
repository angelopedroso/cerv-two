import 'package:cerv_two/core/errors/app_exception.dart';

class BadParametersException implements AppException {
  @override
  final String message;

  @override
  final String field;

  BadParametersException(this.message, this.field);

  @override
  String toString() => message;
}
