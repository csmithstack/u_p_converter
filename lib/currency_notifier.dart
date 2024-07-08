import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
class CurrencyNotifier extends ChangeNotifier {
  late String _currencyCode;
  late String _currencySymbol;
  final NumberFormat _formatter = NumberFormat();

  //TODO: Set with Constant instead?
  CurrencyNotifier(String initialCurrencyCode) {
    _currencyCode = initialCurrencyCode;
    _currencySymbol = _formatter.simpleCurrencySymbol(_currencyCode);
  }

  String get currencyCode => _currencyCode;
  String get currencySymbol => _currencySymbol;

  void updateCurrency(String newCurrencyCode) {
    _currencyCode = newCurrencyCode;
    _currencySymbol = _formatter.simpleCurrencySymbol(newCurrencyCode);
    notifyListeners();
  }
}
