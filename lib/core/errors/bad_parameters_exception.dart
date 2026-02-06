import 'package:cerv_two/core/errors/app_exception.dart';

class BadParametersException implements AppException {
  @override
  final String message;

  BadParametersException(this.message);

  @override
  String toString() => message;
}
