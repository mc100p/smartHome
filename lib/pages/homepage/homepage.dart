import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smarthome/pages/homepage/home_screen_section_1.dart';
import 'package:smarthome/pages/homepage/home_screen_section_2.dart';
import 'package:smarthome/pages/homepage/home_screen_section_3.dart';
import 'package:smarthome/utils/custom_widgets.dart';
import 'package:smarthome/utils/magic_string.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 225, 225),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenSection1(),
            HomeScreenSection2(),
            HomeScreenSection3(),
            Column(
              children: [
                indent(
                  77.0,
                  30,
                  Row(
                    children: [
                      Text(
                        "Best Offers",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(),
                    Flexible(
                      flex: 10,
                      child: Container(
                        //padding: const EdgeInsets.all(1),
                        height: 300,
                        width: double.infinity,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            offers(ImageNames.house_1, "Minneapolis, CA",
                                '860,000', context),
                            offers(ImageNames.house_2, "Louisville, CA",
                                '980,000', context),
                            offers(ImageNames.house_3, "Minneapolis, CA",
                                '860,000', context)
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget offers(
      String imgUrl, String address, String cost, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 11.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.fill,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              address,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              '\$ ${cost.toString()}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
