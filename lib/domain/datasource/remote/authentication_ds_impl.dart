import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/datasource/authentication_ds.dart';
import 'package:flutter_sample/data/mapper/network_errors.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl with AuthenticationDataSource {
  final FirebaseAuth _auth;

  AuthenticationDataSourceImpl(
    this._auth,
  );

  @override
  Future<bool> isLoggedIn() async {
    try {
      final user = _auth.currentUser;
      await user?.reload();
      return user != null;
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }

  @override
  Future<void> logout() async {
    try {
      return _auth.signOut();
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }
}
