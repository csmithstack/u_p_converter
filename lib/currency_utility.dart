import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyUtility extends TextInputFormatter {
  final NumberFormat _formatter = NumberFormat();
  final String currencyCode;
  late int _decimalPlaces;

  // Constructor
  CurrencyUtility({required this.currencyCode});

  // Return the currency symbol for a given currency code.
  String getSymbol(String currencyCode) {
    return _formatter.simpleCurrencySymbol(currencyCode);
  }

  void setDecimalPlaces() {
    _decimalPlaces = getDecimalPlaces(currencyCode);
  }

  int getDecimalPlaces(String currencyCode) {
    NumberFormat selectedFormat =
        NumberFormat.simpleCurrency(name: currencyCode);
    return selectedFormat.maximumFractionDigits;
  }

  // Format textfield inputs to match selected currency
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    setDecimalPlaces();

    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove non-digit characters except for the decimal point
    String digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');

    // Remove leading zeros unless they are immediately followed by a decimal point
    digitsOnly = digitsOnly.replaceFirst(RegExp(r'^0+(?!$|0)'), '');

    if (_decimalPlaces == 0) {
      // If there are no decimal digits, just format as an integer
      return newValue.copyWith(
        text: digitsOnly,
        selection: TextSelection.collapsed(offset: digitsOnly.length),
      );
    }

    // Determine the position of the decimal point
    int decimalPosition = digitsOnly.length - _decimalPlaces;
    if (decimalPosition <= 0) {
      // If not enough digits for decimal, prepend zeros
      digitsOnly = '0' * (-decimalPosition + 1) + digitsOnly;
      decimalPosition = 1;
    }

    // Ensure only one '0' to the left of the decimal point if there are no significant digits
    String newText = '${digitsOnly.substring(0, decimalPosition)}.${digitsOnly.substring(decimalPosition)}';

    // Ensure only one leading zero if the number is less than 1
    newText = newText.replaceFirst(RegExp(r'^0+(?=\.)'), '0');

    // Return the updated value with the cursor at the end
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
