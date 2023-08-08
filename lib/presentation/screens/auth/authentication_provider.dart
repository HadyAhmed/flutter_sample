import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/usecase/user/create_account_uc.dart';
import 'package:flutter_sample/domain/usecase/user/login_uc.dart';
import 'package:flutter_sample/domain/usecase/user/logout_uc.dart';
import 'package:flutter_sample/domain/usecase/user/reset_password_uc.dart';

class AuthenticationProvider with ChangeNotifier {
  bool _isGeneralLoading = false;

  bool get isGeneralLoading => _isGeneralLoading;

  set isGeneralLoading(bool value) {
    _isGeneralLoading = value;
    notifyListeners();
  }

  final _signInWithEmailPasswordUC = locator<LoginUseCase>();
  final _registerAccountUC = locator<CreateAccountUseCase>();
  final _logoutUC = locator<LogoutUseCase>();
  final _resetPasswordUC = locator<ResetPasswordUseCase>();

  Future<UserCredential> loginWithCredentials(String email, String password) {
    return _signInWithEmailPasswordUC.run(email, password);
  }

  Future<UserCredential> createNewAccount(String email, String password) {
    return _registerAccountUC.run(email, password);
  }

  Future<void> resetPassword(String email) {
    return _resetPasswordUC.run(email);
  }

  Future<void> logout() => _logoutUC.run();
}
