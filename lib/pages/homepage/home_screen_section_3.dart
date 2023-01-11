import 'package:flutter/material.dart';
import 'package:smarthome/utils/custom_widgets.dart';

class HomeScreenSection3 extends StatelessWidget {
  const HomeScreenSection3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        indent(
          77.0,
          20,
          Row(
            children: [
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Spacer(flex: 1),
            Flexible(
              flex: 10,
              child: Container(
                height: 100,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    categories(Icons.house, "Houses"),
                    categories(Icons.cottage, "Cottages"),
                    categories(Icons.apartment, "Apartments"),
                    categories(Icons.place, "Offices"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget categories(IconData iconData, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: name == 'Houses' ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,
                color: name == 'Houses' ? Colors.white : Colors.black),
            Text(
              name,
              style: TextStyle(
                  color: name == 'Houses' ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
