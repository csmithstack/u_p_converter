import 'package:flutter/material.dart';
import 'price_tile.dart';
import 'unit_dropdown.dart';
import 'currency_notifier.dart';
import 'package:provider/provider.dart';

class UnitPriceWidget extends StatelessWidget {
  const UnitPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyNotifier>(
      builder: (context, currencyNotifier, child) {
        return Row(
          // Holds Price and Units
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                // Holds Price
                color: Colors.deepOrange,
                child: PriceTile(currencyCode: currencyNotifier.currencyCode),
              ),
            ),
            Expanded(flex: 1, child: Container(color: Colors.green)),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.deepPurple,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                      child: const UnitDropdown(),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


  /* @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyNotifier>(builder: context, CurrencyNotifier, child)
    {}
    Row(
        // Holds Price and Units
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 3,
              child: Container(
                // Holds Price
                color: Colors.deepOrange,
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
                            child: const UnitDropdown()),
                      ])))
        ]);
  }
} */

