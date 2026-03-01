import 'dart:io';

import 'package:cerv_two/core/configs/app_theme.dart';
import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/view/product_list/product_list_view.dart';
import 'package:cerv_two/features/product/viewmodel/product_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  if (Platform.isWindows || Platform.isMacOS) {
    WindowManager.instance.setTitle("CervTwo");
    WindowManager.instance.setMinimumSize(const Size(800, 600));

    sqfliteFfiInit();

    databaseFactory = databaseFactoryFfi;
  }

  DependencyInjection.addDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerv Two',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => sl<ProductListViewModel>(),
        child: const ProductListView(),
      ),
    );
  }
}
