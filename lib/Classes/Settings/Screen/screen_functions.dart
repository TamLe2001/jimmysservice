import 'package:flutter/material.dart';

class ScreenFunctions {
  BuildContext context;
  ScreenFunctions({required this.context});
  double screenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double screenHeight() {
    return MediaQuery.of(context).size.height;
  }
}
