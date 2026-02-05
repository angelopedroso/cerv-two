import 'package:cerv_two/core/errors/app_exception.dart';

class ServerException implements AppException {
  @override
  final String message;

  ServerException(String error) : message = "Erro desconhecido: $error";
}
