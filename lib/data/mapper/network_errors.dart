import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

String handleNetworkErrors(Exception exception) {
  if (exception is FirebaseException) {
    debugPrint(
        '----------------------------------------------------------------------------------------\nError with message $exception\ncode : ${exception.code}\n----------------------------------------------------------------------------------------');
    return _handleErrorCodes(exception.code);
  } else {
    return 'error ${exception.toString()}';
  }
}

String _handleErrorCodes(String code) {
  switch (code) {
    case 'network-request-failed':
      return 'network_errors.connection_error'.tr();
    case 'provider-already-linked':
      return 'The provider has already been linked to the user.';
    case 'invalid-credential':
      return 'The provider\'s credential is not valid.';
    case 'credential-already-in-use':
      return 'authentication_screen.credential_already_in_use'.tr();
    case 'user-disabled':
      return 'authentication_screen.user_disabled'.tr();
    case 'user-not-found':
      return 'authentication_screen.user_not_found'.tr();
    case "operation-not-allowed":
      //  Anonymous auth hasn't been enabled for this project
      return 'The account corresponding to the credential already exists, or is already linked to a Firebase User.';
    default:
      return 'network_errors.unknown'.tr();
  }
}
