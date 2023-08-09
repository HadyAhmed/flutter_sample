import 'package:flutter_sample/data/datasource/source/local/app_preferences_ds.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppConfigurationsDataSource {
  final AppPreferencesDataSource _appPreferences;

  AppConfigurationsDataSource(this._appPreferences);

  bool isInDarkMode() => _appPreferences.getValue<bool>(key: 'is_dark') == true;

  setDarkModePref(bool isDark) =>
      _appPreferences.setValue(key: 'is_dark', value: isDark);

  Future<bool> removeKey(String key) => _appPreferences.removeKey(key);

  Future<bool> removeKeys(List<String> keys) =>
      _appPreferences.removeKeys(keys);

  Future<bool> clearPreferences() => _appPreferences.clearPreferences();
}
