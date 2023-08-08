import 'package:flutter_sample/data/repository/app_preferences_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetDarkModeUseCase {
  final AppPreferencesRepo _repo;

  SetDarkModeUseCase(this._repo);

  run(bool isDark) {
    _repo.setDarkModePref(isDark);
  }
}
