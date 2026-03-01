// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/repositories/i_product_repository.dart';

class ProductListViewModel extends ChangeNotifier {
  final IProductRepository _repository = sl<IProductRepository>();

  late final PagingController<int, ProductModel> pagingController;

  String? _actionError;
  String? _search = '';

  Timer? _debounce;

  String? get actionError => _actionError;

  ProductListViewModel() {
    pagingController = PagingController(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;

        return state.nextIntPageKey;
      },
      fetchPage: _fetchPage,
    );
  }

  Future<List<ProductModel>> _fetchPage(int page) async {
    final res = await _repository.getAll(_search, page, 15);

    return res.items;
  }

  Future<void> deleteProduct(String id) async {
    final state = pagingController.value;

    final newPages = state.pages
        ?.map((e) => e.where((element) => element.id != id).toList())
        .toList();

    pagingController.value = state.copyWith(pages: newPages);

    try {
      await _repository.remove(id);
    } catch (e) {
      pagingController.value = state;

      _actionError = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _actionError = null;
    notifyListeners();
  }

  void search(String? value) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      _search = value;
      pagingController.refresh();
    });
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
