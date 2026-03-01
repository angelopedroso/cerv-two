import 'package:cerv_two/core/errors/app_exception.dart';

class ResourceAlreadyExistsException implements AppException {
  @override
  final String message;

  @override
  final String field;

  ResourceAlreadyExistsException(String fieldV, this.field)
    : message = "$fieldV já existente!";

  @override
  String toString() => message;
}
