import 'package:cerv_two/core/models/pagination_model.dart';
import 'package:cerv_two/features/product/model/product_model.dart';

abstract interface class IProductService {
  Future add(ProductModel model);
  Future remove(String id);
  Future update(ProductModel model);
  Future<PaginationModel<ProductModel>> getAll(
    String? search,
    int page,
    int pageSize,
  );
  Future<ProductModel?> getById(String id);
}
