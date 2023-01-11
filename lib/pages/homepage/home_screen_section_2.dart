import 'package:flutter/material.dart';
import 'package:smarthome/utils/custom_widgets.dart';

class HomeScreenSection2 extends StatelessWidget {
  const HomeScreenSection2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return indent(
      77.0,
      0,
      Column(
        children: [
          Row(
            children: [
              Text("Location"),
            ],
          ),
          TextFormField(
            initialValue: "EVERYWHERE",
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(suffixIcon: Icon(Icons.location_on)),
          )
        ],
      ),
    );
  }
}
