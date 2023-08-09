import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final UserRepo _repo;

  ResetPasswordUseCase(this._repo);

  Future<void> run(String email) {
    return _repo.resetPassword(email);
  }
}
