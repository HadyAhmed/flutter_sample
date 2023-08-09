import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/datasource/source/remote/authentication_ds.dart';
import 'package:flutter_sample/data/datasource/source/remote/users_ds.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepo)
class UserRepoImpl with UserRepo {
  final AuthenticationDataSource _dataSource;
  final UsersDataSource _usersDataSource;

  UserRepoImpl(this._dataSource, this._usersDataSource);

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
  Future<void> createWithCredentials(
    String? name,
    String email,
    String password,
  ) {
    return _dataSource.createWithCredentials(name, email, password);
  }

  @override
  Future<void> resetPassword(String email) {
    return _dataSource.resetPassword(email);
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return _usersDataSource.getUserData(uid);
  }
}
