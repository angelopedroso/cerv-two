import 'package:cerv_two/core/configs/app_colors.dart';
import 'package:cerv_two/core/helpers/app_navigation.dart';
import 'package:cerv_two/core/helpers/app_toast.dart';
import 'package:cerv_two/core/widgets/custom_search_bar.dart';
import 'package:cerv_two/core/widgets/main_app_bar.dart';
import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/view/product_form/product_form_view.dart';
import 'package:cerv_two/features/product/view/product_list/widgets/product_item_list.dart';
import 'package:cerv_two/features/product/viewmodel/product_form_viewmodel.dart';
import 'package:cerv_two/features/product/viewmodel/product_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  Future navigateToForm(BuildContext context, [ProductModel? model]) async {
    final result = await AppNavigation.push(
      context,
      ChangeNotifierProvider(
        create: (_) => sl<ProductFormViewModel>(),
        child: ProductFormView(model: model),
      ),
    );

    if (!context.mounted) return;

    if (result != null && result) {
      context.read<ProductListViewModel>().pagingController.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctx = context.read<ProductListViewModel>();
    final searchController = TextEditingController();

    if (ctx.actionError != null) {
      AppToast.error(context, message: ctx.actionError!);
    }

    return Scaffold(
      appBar: MainAppBar(
        leadingWidth: 400,
        leading: CustomSearchBar(
          controller: searchController,
          onSearch: (value) {
            ctx.search(value);
          },
          placeholder: "Qual produto você está procurando?",
        ),
        actions: [
          IconButton(
            onPressed: () => navigateToForm(context),
            icon: const Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: PagingListener(
          controller: ctx.pagingController,
          builder: (context, state, fetchNextPage) {
            return PagedListView.separated(
              state: state,
              fetchNextPage: fetchNextPage,
              builderDelegate: PagedChildBuilderDelegate<ProductModel>(
                itemBuilder: (context, item, index) {
                  return ProductItemList(
                    model: item,
                    viewModel: ctx,
                    navigate: () => navigateToForm(context, item),
                  );
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Lista vazia",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("Tente adicionar um novo produto"),
                      ],
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) => Container(
                height: 1,
                width: double.infinity,
                color: AppColors.border,
              ),
            );
          },
        ),
      ),
    );
  }
}
