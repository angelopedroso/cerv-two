import 'package:cerv_two/core/errors/app_exception.dart';
import 'package:cerv_two/dependency_injection.dart';
import 'package:cerv_two/features/product/model/product_model.dart';
import 'package:cerv_two/features/product/repositories/i_product_repository.dart';
import 'package:flutter/material.dart';

class ProductFormViewModel extends ChangeNotifier {
  final IProductRepository _repository = sl<IProductRepository>();

  final Map<String, String> _errors = {};
  String? getError(String field) => _errors[field];

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isSuccess = false;
  bool get isSuccess => _isSuccess;

  String _name = '';
  int _valueInCents = 0;
  int _registration = 0;

  void setName(String name) {
    _name = name;
    _errors.remove('name');
    notifyListeners();
  }

  void setValue({String value = '0'}) {
    final parsedValue = double.tryParse(value);

    if (parsedValue == null) {
      _errors['value'] = "Valor inválido. Digite um número válido";
      notifyListeners();

      return;
    }

    _valueInCents = (parsedValue * 100).toInt();
    _errors.remove('value');
    notifyListeners();
  }

  void setRegistration({String value = '0'}) {
    final parsedValue = int.tryParse(value);

    if (parsedValue == null) {
      _errors['registration'] = "Valor inválido. Digite um número válido";
      notifyListeners();

      return;
    }

    _registration = parsedValue;
    _errors.remove('registration');
    notifyListeners();
  }

  Future create() async {
    if (_validate()) return;

    _isLoading = true;
    notifyListeners();

    final model = ProductModel(
      name: _name,
      valueInCents: _valueInCents,
      registration: _registration,
    );

    try {
      await _repository.add(model);

      clearInput();

      _isSuccess = true;
    } on AppException catch (e) {
      _errors[e.field] = e.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future update(String id) async {
    if (_validate()) return;

    _isLoading = true;
    notifyListeners();

    final model = ProductModel(
      id: id,
      name: _name,
      valueInCents: _valueInCents,
      registration: _registration,
    );

    try {
      await _repository.update(model);

      clearInput();

      _isSuccess = true;
    } on AppException catch (e) {
      _errors[e.field] = e.message;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool _validate() {
    _isSuccess = false;
    _errors.clear();

    final nameRegex = RegExp(r"^(?=.*[A-Za-z])[A-Za-z0-9 _-]+$");

    if (_name.isEmpty) {
      _errors['name'] = "Nome é obrigatório";
    }

    if (!nameRegex.hasMatch(_name)) {
      _errors['name'] = "Formato do nome é inválido";
    }

    if (_valueInCents <= 0) {
      _errors['value'] = "Preço deve ser maior que 0";
    }

    if (_registration <= 0) {
      _errors['registration'] = "Nº de registro deve ser maior que 0";
    }

    notifyListeners();

    return _errors.isNotEmpty;
  }

  void clearInput() {
    _name = "";
    _valueInCents = 0;
    _registration = 0;
  }

  void fillInputUpdate(ProductModel model) {
    _name = model.name;
    _valueInCents = model.valueInCents;
    _registration = model.registration;
  }
}
