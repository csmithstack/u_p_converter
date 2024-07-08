import 'package:flutter/material.dart';
import 'title_widget.dart';
import 'unit_price_widget.dart';

class UnitPriceCard extends StatelessWidget {
  const UnitPriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth * 0.8; // 80% of the screen width
        double height = 200.0;
        //constraints.maxHeight * 0.15; // 15% of the screen height

        return Card(
          elevation: 4,
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    // Holds Title
                    alignment: Alignment.topCenter,
                    //padding: const EdgeInsets.all(0),
                    //SizedBox(
                    child: const TitleWidget()),
                Expanded(
                    flex: 1,
                    child: Container(
                        // Holds Price
                        padding:
                            const EdgeInsets.all(5), // To control Row height
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(flex: 1, child: UnitPriceWidget()),
                          ],
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }
}
