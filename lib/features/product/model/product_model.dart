import 'dart:convert';
import 'package:cerv_two/core/entities/model.dart';

class ProductModel extends Model {
  final String name;
  final double value;
  final int registration;

  ProductModel({
    String? id,
    required this.name,
    required this.value,
    required this.registration,
  }) : super(id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': super.id,
      'name': name,
      'value': value,
      'registration': registration,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      value: map['value'] as double,
      registration: map['registration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
