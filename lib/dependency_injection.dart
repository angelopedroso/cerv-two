import 'package:cerv_two/core/database/database_service.dart';
import 'package:cerv_two/core/database/i_database_service.dart';
import 'package:cerv_two/features/product/repositories/i_product_repository.dart';
import 'package:cerv_two/features/product/repositories/product_repository.dart';
import 'package:cerv_two/features/product/services/i_product_service.dart';
import 'package:cerv_two/features/product/services/product_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class DependencyInjection {
  static void addDI() {
    sl.registerSingleton<IDatabaseService>(const DatabaseService());

    _addService();
    _addRepository();
  }

  static void _addRepository() {
    sl.registerLazySingleton<IProductRepository>(() => ProductRepository());
  }

  static void _addService() {
    sl.registerFactory<IProductService>(() => ProductService());
  }
}
