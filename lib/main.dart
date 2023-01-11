import 'package:flutter/material.dart';
import 'package:smarthome/pages/welcome/welcome.dart';
import 'package:smarthome/utils/route.dart';

void main() {
  runApp(const MyApp());
}

var router = RouteGenerator().router;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
      ),
      home: Welcome(),
    );
  }
}
