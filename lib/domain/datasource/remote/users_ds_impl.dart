import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/datasource/source/remote/users_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UsersDataSource)
class UsersDataSourceImpl with UsersDataSource {
  final FirebaseFirestore _firestore;

  UsersDataSourceImpl(this._firestore);

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid) {
    return _firestore.collection('Users').doc(uid).get();
  }
}
