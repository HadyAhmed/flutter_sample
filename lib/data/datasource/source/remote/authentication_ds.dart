import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin AuthenticationDataSource {
  Future<void> logout();

  Future<User?> userData();

  Future<UserCredential> loginWithCredentials(String email, String password);

  Future<void> createWithCredentials(
    String? name,
    String email,
    String password,
  );

  Future<void> resetPassword(String email);
}
