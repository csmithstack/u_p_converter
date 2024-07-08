import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'unit_notifier.dart'; // Replace with your correct import path

class UnitDropdown extends StatelessWidget {
  const UnitDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitNotifier>(
      builder: (context, unitNotifier, child) {
        // Listen for changes in UnitNotifier
        List<String> dropdownList = unitNotifier.unitList;
        String dropdownSelection = unitNotifier.selectedUnit ?? '';

        return DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          value: dropdownSelection,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 42,
          underline: const SizedBox(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              unitNotifier
                  .updateSelectedUnit(newValue); // Update selected system unit
            }
          },
          items: dropdownList.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
    );
  }
}
