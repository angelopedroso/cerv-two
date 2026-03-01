import 'package:cerv_two/core/helpers/app_toast.dart';
import 'package:cerv_two/core/widgets/main_app_bar.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/viewmodel/product_form_viewmodel.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductFormView extends StatefulWidget {
  const ProductFormView({super.key, this.model});

  final ProductModel? model;

  @override
  State<ProductFormView> createState() => _ProductFormViewState();
}

class _ProductFormViewState extends State<ProductFormView> {
  late ProductFormViewModel vm;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _registrationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    vm = context.read<ProductFormViewModel>();

    final isUpdate = widget.model?.id != null;

    if (isUpdate) {
      vm.fillInputUpdate(widget.model!);

      _nameController.text = widget.model!.name;
      _priceController.text = (widget.model!.value).toString();
      _registrationController.text = widget.model!.registration.toString();
    }

    vm.addListener(() {
      if (vm.getError("server") != null) {
        AppToast.error(context, message: vm.getError("server")!);
      }
    });
  }

  Future _handleSubmitForm(ProductFormViewModel vm) async {
    final isUpdate = widget.model?.id != null;
    if (isUpdate) {
      await vm.update(widget.model!.id);
    } else {
      await vm.create();
    }

    if (!mounted) return;

    if (vm.isSuccess) {
      final msg =
          "Produto ${isUpdate ? "atualizado" : "adicionado"} com sucesso!";

      AppToast.success(context, title: msg);

      _nameController.clear();
      _priceController.clear();
      _registrationController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = CurrencyTextInputFormatter.currency(
      locale: "pt_BR",
      symbol: "",
      enableNegative: false,
    );

    return Scaffold(
      appBar: const MainAppBar<bool>(
        hasBackButton: true,
        navigationReturn: true,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Selector<ProductFormViewModel, String?>(
                  selector: (_, v) => v.getError("name"),
                  builder: (_, err, _) => TextFormField(
                    controller: _nameController,
                    onChanged: (value) => vm.setName(value),
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorHeight: 12,
                    decoration: InputDecoration(
                      label: const Text("Nome"),
                      helper: Text(
                        "Nome do produto",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      errorText: err,
                    ),
                  ),
                ),

                Selector<ProductFormViewModel, String?>(
                  selector: (_, v) => v.getError("value"),
                  builder: (_, err, _) => TextFormField(
                    controller: _priceController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorHeight: 12,
                    onChanged: (_) => vm.setValue(
                      value: currencyFormatter.getUnformattedValue().toString(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [currencyFormatter],
                    decoration: InputDecoration(
                      prefix: const Text(
                        "R\$ ",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      label: const Text("Preço"),
                      helper: Text(
                        "Preço do produto",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      errorText: err,
                    ),
                  ),
                ),
                Selector<ProductFormViewModel, String?>(
                  selector: (_, v) => v.getError("registration"),
                  builder: (_, err, _) => TextFormField(
                    controller: _registrationController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    cursorHeight: 12,
                    onChanged: (value) => vm.setRegistration(value: value),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      label: const Text("Nº de registro"),
                      helper: Text(
                        "Nº de registro do produto",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      errorText: err,
                    ),
                  ),
                ),
                Consumer<ProductFormViewModel>(
                  builder: (_, v, _) => Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style
                          ?.copyWith(
                            minimumSize: const WidgetStatePropertyAll(
                              Size(180, 40),
                            ),
                            padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                      onPressed: v.isLoading
                          ? null
                          : () => _handleSubmitForm(v),
                      child: v.isLoading
                          ? const SizedBox(
                              height: 12,
                              width: 12,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.25,
                              ),
                            )
                          : const Text("Confirmar"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
