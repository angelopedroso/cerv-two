import 'package:cerv_two/core/models/pagination_model.dart';
import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/repositories/i_product_repository.dart';
import 'package:cerv_two/features/product/services/i_product_service.dart';

class ProductRepository implements IProductRepository {
  final IProductService _service = sl<IProductService>();

  @override
  Future add(ProductModel model) async {
    await _service.add(model);
  }

  @override
  Future<PaginationModel<ProductModel>> getAll(int page, int pageSize) async {
    return await _service.getAll(page, pageSize);
  }

  @override
  Future<ProductModel?> getById(String id) async {
    return await _service.getById(id);
  }

  @override
  Future remove(String id) async {
    await _service.remove(id);
  }

  @override
  Future update(ProductModel model) async {
    await _service.update(model);
  }
}
