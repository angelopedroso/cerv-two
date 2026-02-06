import 'dart:convert';
import 'package:cerv_two/core/entities/model.dart';

class ProductModel extends Model {
  String name;
  int valueInCents;
  int registration;

  double get value => valueInCents / 100;

  ProductModel({
    String? id,
    required this.name,
    required this.valueInCents,
    required this.registration,
  }) : super(id);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': super.id,
      'name': name,
      'valueInCents': valueInCents,
      'registration': registration,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      valueInCents: map['valueInCents'] as int,
      registration: map['registration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
