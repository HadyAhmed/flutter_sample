import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUseCase {
  final UserRepo _repo;

  GetUserUseCase(this._repo);

  Future<DocumentSnapshot<Map<String, dynamic>>> run(String uid) {
    return _repo.getUserData(uid);
  }
}
