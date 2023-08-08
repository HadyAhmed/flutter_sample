import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/datasource/authentication_ds.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepo)
class UserRepoImpl with UserRepo {
  final AuthenticationDataSource _dataSource;

  UserRepoImpl(this._dataSource);

  @override
  Future<User?> userData() => _dataSource.userData();

  @override
  Future<void> logout() async {
    return _dataSource.logout();
  }

  @override
  Future<UserCredential> loginWithCredentials(String email, String password) {
    return _dataSource.loginWithCredentials(email, password);
  }

  @override
  Future<UserCredential> createWithCredentials(String email, String password) {
    return _dataSource.createWithCredentials(email, password);
  }

  @override
  Future<void> resetPassword(String email) {
    return _dataSource.resetPassword(email);
  }
}
