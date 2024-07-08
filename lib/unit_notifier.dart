import 'package:flutter/foundation.dart';
import 'constants.dart';
import 'measure_notifier.dart';
import 'system_notifier.dart';

// Notifies widgets of changes to the selected Unit of Measure
class UnitNotifier with ChangeNotifier {
  late String? _systemUnit;
  late String? _selectedUnit;
  late MeasureNotifier _measureNotifier;
  late SystemNotifier _systemNotifier;
  late List<String> _unitList;

  UnitNotifier({
    required MeasureNotifier measureNotifier,
    required SystemNotifier systemNotifier,
  }) {
    _measureNotifier = measureNotifier;
    _systemNotifier = systemNotifier;
    _systemUnit =
        '${_systemNotifier.selectedSystem}_${_measureNotifier.selectedMeasure}';
    _measureNotifier.addListener(_setUnitList);
    _systemNotifier.addListener(_setUnitList);
    _unitList = _setUnitList();
    _selectedUnit = _unitList.first;
  }

  List<String> _setUnitList() {
    String? system = _systemNotifier.selectedSystem;
    String? measure = _measureNotifier.selectedMeasure;

    _systemUnit = '${system}_$measure';

    if (system == 'Imperial') {
      if (measure == 'Volume') {
        return ConstantValues.unitsImperialVolume;
      } else if (measure == 'Weight') {
        return ConstantValues.unitsImperialWeight;
      }
    } else if (system == 'Metric') {
      if (measure == 'Volume') {
        return ConstantValues.unitsMetricVolume;
      } else if (measure == 'Weight') {
        return ConstantValues.unitsMetricWeight;
      }
    }
    return [];
  }

  void updateSelectedUnit(String newUnit) {
    _selectedUnit = newUnit;
  }

  void _onMeasureChange() {
    _unitList = _setUnitList(); // Update unit list when measure changes
    _selectedUnit = _unitList.first;
    notifyListeners(); // Notify listeners about the change
  }

  void _onSystemChange() {
    _unitList = _setUnitList(); // Update unit list when system changes
    _selectedUnit = _unitList.first;
    notifyListeners(); // Notify listeners about the change
  }

  String? get systemUnit => _systemUnit;

  String? get selectedUnit => _selectedUnit;

  List<String> get unitList => _unitList;
}
