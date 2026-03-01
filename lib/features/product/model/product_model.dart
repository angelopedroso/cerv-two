import 'dart:convert';
import 'package:cerv_two/core/entities/model.dart';
import 'package:intl/intl.dart';

class ProductModel extends Model {
  String name;
  int valueInCents;
  int registration;

  double get value => valueInCents / 100;
  String get currencyValue =>
      NumberFormat.simpleCurrency(locale: 'pt-BR').format(valueInCents / 100);

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
      'value_in_cents': valueInCents,
      'registration': registration,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      valueInCents: map['value_in_cents'] as int,
      registration: map['registration'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
