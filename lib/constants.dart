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

class HeightWidthConfig {
  static late double width36;
  static late double height36;
  static late double fontSize14;
  static late double fontSize17;
  static late double fontSize18;
  static late double fontSize20;
  static late double fontSize22;
  static late double fontSize24;
  static late double fontSize30;

  static void init(BuildContext context) {
    width36= 17 * screenWidth / 360;
    height36= 17 * screenHeight / 360;
    fontSize14= 14 * screenWidth / 360;
    fontSize17= 17 * screenWidth / 360;
    fontSize18= 18 * screenWidth / 360;
    fontSize20= 20 * screenWidth / 360;
    fontSize22= 22 * screenWidth / 360;
    fontSize24= 24 * screenWidth / 360;
    fontSize30= 30 * screenWidth / 360;
  }
}