import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final UserRepo _repo;

  LogoutUseCase(this._repo);

  Future<void> run() => _repo.logout();
}
