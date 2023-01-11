import 'package:flutter/material.dart';

Widget indent(double horizontal, double vertical, Widget child) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: child,
  );
}
