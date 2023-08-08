import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/usecase/user/get_user_data_uc.dart';

class SplashProvider with ChangeNotifier {
  final _isLoggedIn = locator<GetUserDataUseCase>();

  Future<User?> isLoggedIn() => _isLoggedIn.run();
}
