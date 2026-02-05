import 'package:cerv_two/core/database/database_service.dart';
import 'package:cerv_two/core/database/i_database_service.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static final GetIt _sl = GetIt.instance;

  static void addDI() {
    _sl.registerSingleton<IDatabaseService>(DatabaseService.db);
  }
}
