import 'package:flutter/foundation.dart';
import 'constants.dart';

// Notifies widgets of changes to the selected Unit of Measure
class MeasureNotifier with ChangeNotifier {
  String _selectedMeasure = ConstantValues.unitsOfMeasure.first;
  List<String> _measureList = ConstantValues.unitsOfMeasure;

  String get selectedMeasure => _selectedMeasure;
  List<String> get measureList => _measureList;

  void updateSelectedMeasure(String newMeasure) {
    _selectedMeasure = newMeasure;
    notifyListeners();
  }
}
