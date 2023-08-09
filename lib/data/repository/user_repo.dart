import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin UserRepo {
  Future<User?> userData();

  Future<UserCredential> loginWithCredentials(String email, String password);

  Future<void> createWithCredentials(String? name,
      String email,
      String password,);

  Future<void> resetPassword(String email);

  Future<void> logout();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid);

  Future<DocumentSnapshot<Map<String, dynamic>>> getAccountData();

  Future<void> updateName(String name);
}
