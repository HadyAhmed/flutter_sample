import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAccountUseCase {
  final UserRepo _repo;

  CreateAccountUseCase(this._repo);

  Future<void> run(
    String? name,
    String email,
    String password,
  ) {
    return _repo.createWithCredentials(name, email, password);
  }
}
