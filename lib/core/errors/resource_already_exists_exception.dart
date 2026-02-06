import 'package:cerv_two/core/errors/app_exception.dart';

class ResourceAlreadyExistsException implements AppException {
  @override
  final String message;

  ResourceAlreadyExistsException(String field)
    : message = "$field já existente!";

  @override
  String toString() => message;
}
