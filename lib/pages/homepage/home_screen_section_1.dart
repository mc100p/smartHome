import 'package:flutter/material.dart';
import 'package:smarthome/utils/custom_widgets.dart';

class HomeScreenSection1 extends StatelessWidget {
  const HomeScreenSection1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 100.0,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 19,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
          ),
          indent(
            77,
            0,
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dream House:",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Find Yours",
                      style: TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
