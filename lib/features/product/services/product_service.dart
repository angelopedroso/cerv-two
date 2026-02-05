import 'package:cerv_two/core/database/i_database_service.dart';
import 'package:cerv_two/core/errors/bad_parameters_exception.dart';
import 'package:cerv_two/core/errors/resource_already_exists_exception.dart';
import 'package:cerv_two/core/errors/server_exception.dart';
import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/services/i_product_service.dart';
import 'package:sqflite/sqflite.dart';

class ProductService implements IProductService {
  @override
  Future add(ProductModel model) async {
    final db = await sl<IDatabaseService>().database;

    try {
      await db.insert("product", model.toMap());
    } on DatabaseException catch (e) {
      print(e.toString());

      final msg = e.toString();

      if (msg.contains('value_error')) {
        throw BadParametersException("Valor deve ser maior que 0");
      }

      if (msg.contains('registration_error')) {
        throw BadParametersException(
          "Código de registro do produto deve ser maior que 0",
        );
      }

      if (e.isUniqueConstraintError()) {
        throw ResourceAlreadyExistsException("Código de registro");
      }

      throw ServerException(msg);
    }
  }

  @override
  Future<List<ProductModel>> getAll() async {
    final db = await sl<IDatabaseService>().database;

    final res = await db.query("product", orderBy: "created_at ASC");

    if (res.isEmpty) return [];

    return res.map((e) => ProductModel.fromMap(e)).toList();
  }

  @override
  Future<ProductModel?> getById(String id) async {
    final db = await sl<IDatabaseService>().database;

    final res = await db.query("product", where: "id = ?", whereArgs: [id]);

    if (res.isEmpty) return null;

    return ProductModel.fromMap(res.first);
  }

  @override
  Future remove(String id) async {
    final db = await sl<IDatabaseService>().database;

    await db.delete("product", where: "id = ?", whereArgs: [id]);
  }

  @override
  Future update(ProductModel model) async {
    final db = await sl<IDatabaseService>().database;

    try {
      await db.update(
        "product",
        model.toMap(),
        where: "id = ?",
        whereArgs: [model.id],
      );
    } on DatabaseException catch (e) {
      final msg = e.toString();

      if (msg.contains('value_error')) {
        throw BadParametersException("Valor deve ser maior que 0");
      }

      if (msg.contains('registration_error')) {
        throw BadParametersException(
          "Código de registro do produto deve ser maior que 0",
        );
      }

      if (e.isUniqueConstraintError()) {
        throw ResourceAlreadyExistsException("Código de registro");
      }

      throw ServerException(msg);
    }
  }
}
