import 'package:cerv_two/core/helpers/app_alert_dialog.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/viewmodel/product_list_viewmodel.dart';
import 'package:flutter/material.dart';

class ProductItemList extends StatelessWidget {
  const ProductItemList({
    super.key,
    required this.model,
    required this.viewModel,
    required this.navigate,
  });

  final ProductModel model;
  final ProductListViewModel viewModel;
  final VoidCallback navigate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(fontSize: 18),
                ),
                Text(
                  "Reg.: ${model.registration.toString()}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  model.currencyValue,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            PopupMenuButton(
              constraints: const BoxConstraints(minWidth: 300),
              tooltip: "",
              itemBuilder: (context) => [
                PopupMenuItem(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  height: 10,
                  onTap: () => navigate(),
                  child: const Text('Editar'),
                ),
                PopupMenuItem(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  height: 10,
                  child: const Text('Excluir'),
                  onTap: () => AppAlertDialog.alert(
                    context: context,
                    title: "Você tem absoluta certeza?",
                    description:
                        "Essa ação não poderá ser desfeita. Essa ação irá remover permanentemente o produto.",
                    onConfirm: () => viewModel.deleteProduct(model.id),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
