import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class IsLoggedInUseCase {
  final UserRepo _repo;

  IsLoggedInUseCase(this._repo);

  Future<bool> run() => _repo.isLoggedIn();
}
