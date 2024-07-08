import 'package:flutter/foundation.dart';
import 'constants.dart';

// Notifies widgets of changes to the selected Unit of Measure
class MeasureNotifier with ChangeNotifier {
  String _selectedMeasure = ConstantValues.unitsOfMeasure.first;

  String? get selectedMeasure => _selectedMeasure;

  void updateSelectedMeasure(String newMeasure) {
    _selectedMeasure = newMeasure;
    notifyListeners();
  }
}
