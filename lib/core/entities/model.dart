import 'package:uuid/uuid.dart';

class Model {
  final String id;

  Model(String? id) : id = id ?? const Uuid().v4();
}
