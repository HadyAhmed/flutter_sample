import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateNameUseCase {
  final UserRepo _repo;

  UpdateNameUseCase(this._repo);

  Future<void> run(String name) {
    return _repo.updateName(name);
  }
}
