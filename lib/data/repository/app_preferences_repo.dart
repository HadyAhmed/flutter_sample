import 'package:injectable/injectable.dart';

@injectable
mixin AppPreferencesRepo {
  setDarkModePref(bool isDark);

  bool isInDarkMode();

  Future<bool> removeKey(String key);

  removeKeys(List<String> keys);

  Future<bool> clearPreferences();
}
