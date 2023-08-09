import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AppPreferencesDataSource {
  final SharedPreferences _pref;

  AppPreferencesDataSource(this._pref);

  Future<bool> setValue({required String key, required dynamic value}) {
    if (value is String) {
      return _pref.setString(key, value);
    } else if (value is bool) {
      return _pref.setBool(key, value);
    } else if (value is int) {
      return _pref.setInt(key, value);
    } else if (value is double) {
      return _pref.setDouble(key, value);
    } else {
      return _pref.setStringList(key, value);
    }
  }

  dynamic getValue<T>({required String key}) => _pref.get(key);

  Future<bool> removeKey(String key) => _pref.remove(key);

  Future<bool> removeKeys(List<String> keys) async {
    bool removed = false;
    for (var element in keys) {
      removed = await _pref.remove(element);
    }
    return removed;
  }

  Future<bool> clearPreferences() => _pref.clear();
}
