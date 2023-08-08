import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  showSnackBar(
      {required String message,
      SnackBarAction? action,
      bool? showCloseIcon,
      bool? showLongDuration}) {
    final snackBar = SnackBar(
      content: Text(message),
      action: action,
      showCloseIcon: showCloseIcon,
      duration: showLongDuration == true
          ? const Duration(minutes: 3)
          : const Duration(milliseconds: 4000),
    );
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(snackBar);
  }
}
