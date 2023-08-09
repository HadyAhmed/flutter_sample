import 'package:flutter_sample/data/datasource/source/local/app_config_ds.dart';
import 'package:flutter_sample/data/repository/app_preferences_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AppPreferencesRepo)
class AppPreferencesRepoImpl with AppPreferencesRepo {
  final AppConfigurationsDataSource _dataSource;

  AppPreferencesRepoImpl(this._dataSource);

  @override
  bool isInDarkMode() => _dataSource.isInDarkMode();

  @override
  setDarkModePref(bool isDark) => _dataSource.setDarkModePref(isDark);

  @override
  Future<bool> removeKey(String key) => _dataSource.removeKey(key);

  @override
  Future<bool> removeKeys(List<String> keys) => _dataSource.removeKeys(keys);

  @override
  Future<bool> clearPreferences() => _dataSource.clearPreferences();
}
