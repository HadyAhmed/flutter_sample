import 'package:flutter/material.dart';

extension SizeUtils on BuildContext {
  double getWidth() => MediaQuery.of(this).size.width;

  double getHeight() => MediaQuery.of(this).size.width;

  Size getSize() => MediaQuery.of(this).size;

  double getWidthPercentage(double percentage) =>
      (MediaQuery.of(this).size.width * percentage) / 100;

  double getHeightPercentage(double percentage) =>
      (MediaQuery.of(this).size.height * percentage) / 100;

  Size getSizePercentage(double percentage) =>
      (MediaQuery.of(this).size * percentage) / 100;
}
