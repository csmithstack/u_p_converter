import 'package:flutter/material.dart';
import 'price_tile.dart';
import 'unit_dropdown.dart';

class UnitPriceWidget extends StatelessWidget {
  const UnitPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        // Holds Price and Units
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                // Holds Price
                color: Colors.deepOrange,
                // TODO: Figure out how to pass currencyCode from parent
                child: const PriceTile(),
              )),
          Expanded(flex: 1, child: Container(color: Colors.green)),
          Expanded(
              flex: 3,
              child: Container(
                  color: Colors.deepPurple,
                  child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ignore: prefer_const_constructors
                        Text(
                          'Per',
                          selectionColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: UnitDropdown()),
                      ])))
        ]);
  }
}
