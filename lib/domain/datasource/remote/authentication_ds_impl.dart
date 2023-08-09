import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/data/datasource/source/remote/authentication_ds.dart';
import 'package:flutter_sample/data/mapper/network_errors.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl with AuthenticationDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthenticationDataSourceImpl(
    this._auth,
    this._firestore,
  );

  @override
  Future<User?> userData() async {
    try {
      final user = _auth.currentUser;
      await user?.reload();
      debugPrint('Current User Data : $user');
      return user;
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }

  @override
  Future<UserCredential> loginWithCredentials(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  @override
  Future<void> createWithCredentials(
    String? name,
    String email,
    String password,
  ) async {
    try {
      return await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        return await _firestore.collection('Users').doc(value.user?.uid).set({
          'name': name,
          'image': null,
          'email': email,
        });
      });
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }
}
