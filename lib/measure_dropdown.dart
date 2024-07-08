import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_p_converter/measure_notifier.dart';
import 'constants.dart';
import 'measure_notifier.dart';

class MeasureDropdown extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  MeasureDropdown({this.onChanged});

  @override
  _MeasureDropdownState createState() => _MeasureDropdownState();
}

class _MeasureDropdownState extends State<MeasureDropdown> {
  String? selectedMeasure;

  @override
  Widget build(BuildContext context) {
    return Consumer<MeasureNotifier>(
      builder: (context, measureNotifier, child) {
        // Listen for changes in MeasureNotifier
        List<String> dropdownList = measureNotifier.measureList;
        String dropdownSelection = measureNotifier.selectedMeasure ?? '';

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            value: dropdownSelection,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 42,
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                measureNotifier.updateSelectedMeasure(
                    newValue); // Update selected system unit
              }
            },
            items: dropdownList.map<DropdownMenuItem<String>>((String unit) {
              return DropdownMenuItem<String>(
                value: unit,
                child: Text(unit),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
