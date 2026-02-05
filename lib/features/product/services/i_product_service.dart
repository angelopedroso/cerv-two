import 'package:cerv_two/features/product/model/product_model.dart';

abstract interface class IProductService {
  Future add(ProductModel model);
  Future remove(String id);
  Future update(ProductModel model);
  Future<List<ProductModel>> getAll();
  Future<ProductModel?> getById(String id);
}
