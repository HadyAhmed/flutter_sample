import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final UserRepo _repo;

  LoginUseCase(this._repo);

  Future<UserCredential> run(String email, String password) {
    return _repo.loginWithCredentials(email, password);
  }
}
