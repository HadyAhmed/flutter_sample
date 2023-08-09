import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/datasource/source/remote/users_ds.dart';
import 'package:flutter_sample/data/mapper/network_errors.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UsersDataSource)
class UsersDataSourceImpl with UsersDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UsersDataSourceImpl(this._firestore, this._auth);

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return _firestore.collection('Users').doc(uid).get();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getAccountData() {
    return _firestore.collection('Users').doc(_auth.currentUser?.uid).get();
  }

  @override
  Future<void> updateName(String name) async {
    try {
      return await _firestore
          .collection('Users')
          .doc(_auth.currentUser?.uid)
          .update({'name': name});
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }
}
