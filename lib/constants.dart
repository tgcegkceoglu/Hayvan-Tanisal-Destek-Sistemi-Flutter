import 'package:flutter/material.dart';
import 'dart:ui' as ui;


late double screenWidth = ui.window.physicalSize.width / ui.window.devicePixelRatio;
late double screenHeight = ui.window.physicalSize.height / ui.window.devicePixelRatio;

class TextConfig {
  static late double fontSize10;
  static late double fontSize12;
  static late double fontSize14;
  static late double fontSize17;
  static late double fontSize18;
  static late double fontSize20;
  static late double fontSize22;
  static late double fontSize24;
  static late double fontSize30;

  static void init(BuildContext context) {
    fontSize10 = 10 * screenWidth / 360;
    fontSize12 = 12 * screenWidth / 360;
    fontSize14 = 14 * screenWidth / 360;
    fontSize17 = 17 * screenWidth / 360;
    fontSize18 = 18 * screenWidth / 360;
    fontSize20 = 20 * screenWidth / 360;
    fontSize22 = 22 * screenWidth / 360;
    fontSize24 = 24 * screenWidth / 360;
    fontSize30 = 30 * screenWidth / 360;
  }
}

class SizedConfig {
  static late double size30;
  static late double size17;
  static late double size13;
  static late double size10;
  static late double size8;
  static late double size3;
  static late double size20;
  static late double size25;

  static void init(BuildContext context) {
    size8= 8 * screenHeight / 360;
    size3= 3* screenHeight / 360;
    size13= 13 * screenHeight / 360;
    size10= 10 * screenHeight / 360;
    size17= 17 * screenHeight / 360;
    size20= 20 * screenHeight / 360;
    size25= 25 * screenHeight / 360;
    size30= 30 * screenHeight / 360;
  }
}
