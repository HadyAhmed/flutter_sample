import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension Strings on String {
  bool isDigits() {
    RegExp numeric = RegExp(r'^[0-9]+$');
    return numeric.hasMatch(this);
  }

  bool isValidPhoneNumber({String? regex}) {
    // this are the default regex for Egypt phone numbers
    RegExp numeric = RegExp(regex ?? '^(01)(0|1|2|5)[0-9]{8}\$');
    return numeric.hasMatch(this);
  }

  String convertToEnglishNumbers() {
    var result = '';
    var en = '';
    for (var ch in characters) {
      switch (ch) {
        case '٠':
          en = '0';
          break;
        case '١':
          en = '1';
          break;
        case '٢':
          en = '2';
          break;
        case '٣':
          en = '3';
          break;
        case '٤':
          en = '4';
          break;
        case '٥':
          en = '5';
          break;
        case '٦':
          en = '6';
          break;
        case '٧':
          en = '7';
          break;
        case '٨':
          en = '8';
          break;
        case '٩':
          en = '9';
          break;
        default:
          en = ch;
          break;
      }
      result = '$result$en';
    }
    return result;
  }

  String convertToArabicNumbers() {
    var result = '';
    var en = '';
    for (var ch in characters) {
      switch (ch) {
        case '0':
          en = '٠';
          break;
        case '1':
          en = '١';
          break;
        case '2':
          en = '٢';
          break;
        case '3':
          en = '٣';
          break;
        case '4':
          en = '٤';
          break;
        case '5':
          en = '٥';
          break;
        case '6':
          en = '٦';
          break;
        case '7':
          en = '٧';
          break;
        case '8':
          en = '٨';
          break;
        case '9':
          en = '٩';
          break;
        default:
          en = ch;
          break;
      }
      result = '$result$en';
    }
    return result;
  }
}

extension LocalizedStrings on BuildContext {
  String localizedNumbers(String number) {
    if (locale.languageCode == 'ar') {
      return number.convertToArabicNumbers();
    } else {
      return number.convertToEnglishNumbers();
    }
  }
}
