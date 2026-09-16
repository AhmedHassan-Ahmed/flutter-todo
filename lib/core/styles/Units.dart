import 'package:flutter/material.dart';

class Units {
  static const double designWidth = 375;
  static const double designHeight = 812;

  static double width(BuildContext context, double value) {
    final screenWidth = MediaQuery.of(context).size.width;
    return value * screenWidth / designWidth;
  }

  static double height(BuildContext context, double value) {
    final screenHeight = MediaQuery.of(context).size.height;
    return value * screenHeight / designHeight;
  }

  static double font(BuildContext context, double value) {
    final screenWidth = MediaQuery.of(context).size.width;
    return value * screenWidth / designWidth;
  }

  static double radius(BuildContext context, double value) {
    final screenWidth = MediaQuery.of(context).size.width;
    return value * screenWidth / designWidth;
  }
}