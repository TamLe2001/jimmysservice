import 'package:flutter/material.dart';

class SFs {
  BuildContext context;
  SFs({required this.context});

  double screenWidth(double x) {
    return MediaQuery.of(context).size.width * x;
  }

  double screenHeight(double x) {
    return MediaQuery.of(context).size.height * x;
  }
}
