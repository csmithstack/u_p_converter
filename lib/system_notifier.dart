import 'package:flutter/foundation.dart';
import 'constants.dart';

// Notifies widgets of changes to the selected Unit of Measure
class SystemNotifier with ChangeNotifier {
  String _selectedSystem = ConstantValues.systemsOfMeasure.first;

  String? get selectedSystem => _selectedSystem;

  void updateSelectedSystem(String newSystem) {
    _selectedSystem = newSystem;
    notifyListeners();
  }
}
