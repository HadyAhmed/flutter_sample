import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension LayoutExt on BuildContext {
  Orientation getOrientation() {
    return MediaQuery.of(this).orientation;
  }

  bool isRTL() {
    return locale.languageCode == 'ar';
  }
}
