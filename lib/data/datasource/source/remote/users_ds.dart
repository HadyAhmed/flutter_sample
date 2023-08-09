import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin UsersDataSource {
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(String uid);
}
