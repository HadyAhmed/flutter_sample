import 'package:flutter_sample/data/repository/app_preferences_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDarkModeUseCase {
  final AppPreferencesRepo _repo;

  GetDarkModeUseCase(this._repo);

  bool run() => _repo.isInDarkMode();
}
