import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAccountDataUseCase {
  final UserRepo _repo;

  GetAccountDataUseCase(this._repo);

  Future<DocumentSnapshot<Map<String, dynamic>>> run() {
    return _repo.getAccountData();
  }
}
