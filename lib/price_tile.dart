import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'currency_utility.dart';
import 'currency_notifier.dart';
import 'package:provider/provider.dart';

//TODO: Refactor this class to use a TextInputFormatter: https://www.youtube.com/watch?v=4v4l6E8Sbj8
// TODO: Create a Currency struct for the different nationalizations

class PriceTile extends StatefulWidget {
  final String currencyCode;

  // COnstructor
  const PriceTile({super.key, required this.currencyCode});

  @override
  State<PriceTile> createState() => _PriceTileState();
}

class _PriceTileState extends State<PriceTile> {
  // Members
  late TextEditingController _controller;
  late String _currencyCode;
  late String _currencySymbol;
  late final NumberFormat _formatter = NumberFormat();

  // Initialization
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  // Cleanup
  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  // Build
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyNotifier>(
        builder: (context, currencyNotifier, child) {
      return Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Unit Price (${currencyNotifier.currencySymbol})',
              selectionColor: Colors.white,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            FractionallySizedBox(
                widthFactor: 0.5,
                // TODO: Set minimum width
                child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(8),
                      CurrencyUtility(
                          currencyCode: currencyNotifier.currencyCode)
                    ],
                    textAlign: TextAlign.right,
                    //maxLength: 30,
                    controller: _controller,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 100),
                      fillColor: Colors.white,
                      filled: true,
                      counterText: '', // Hides the character count
                      hintText: 'Enter Price',
                      // ignore: prefer_const_constructors
                      border: OutlineInputBorder(),
                    )))
          ]);
    });
  }
}
