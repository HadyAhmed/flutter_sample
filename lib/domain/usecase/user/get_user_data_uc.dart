import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase {
  final UserRepo _repo;

  GetUserDataUseCase(this._repo);

  Future<User?> run() => _repo.userData();
}
