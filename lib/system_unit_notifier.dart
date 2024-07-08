// THis can all be done with conditional logic in the dropdown...

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'system_notifier.dart';
import 'measure_notifier.dart';

// Notifies widgets of changes to the selected
// _systemUnit determines the UnitDropdownButton contents
class SystemUnitNotifier with ChangeNotifier {
  String? _selectedUnit;

  //TODO: Set with Constant instead?
  MeasureNotifier(String initialUnit) {
    _selectedUnit = initialUnit;
  }

  String? get selected => _selectedUnit;

  void updateSelectedSystem(String newUnit) {
    _selectedUnit = newUnit;
    notifyListeners();
  }
}
