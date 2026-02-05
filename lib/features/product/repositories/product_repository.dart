import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/repositories/i_product_repository.dart';
import 'package:cerv_two/features/product/services/i_product_service.dart';

class ProductRepository implements IProductRepository {
  @override
  Future add(ProductModel model) async {
    await sl<IProductService>().add(model);
  }

  @override
  Future<List<ProductModel>> getAll() async {
    return await sl<IProductService>().getAll();
  }

  @override
  Future<ProductModel?> getById(String id) async {
    return await sl<IProductService>().getById(id);
  }

  @override
  Future remove(String id) async {
    await sl<IProductService>().remove(id);
  }

  @override
  Future update(ProductModel model) async {
    await sl<IProductService>().update(model);
  }
}
