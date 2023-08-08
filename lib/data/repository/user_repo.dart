import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin UserRepo {
  Future<User?> userData();

  Future<UserCredential> loginWithCredentials(String email, String password);

  Future<UserCredential> createWithCredentials(String email, String password);

  Future<void> resetPassword(String email);

  Future<void> logout();
}
