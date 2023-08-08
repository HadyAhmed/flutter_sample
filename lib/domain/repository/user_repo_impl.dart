import 'package:flutter_sample/data/datasource/authentication_ds.dart';
import 'package:flutter_sample/data/repository/user_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepo)
class UserRepoImpl with UserRepo {
  final AuthenticationDataSource _dataSource;

  UserRepoImpl(this._dataSource);

  @override
  Future<bool> isLoggedIn() => _dataSource.isLoggedIn();

  @override
  Future<void> logout() async {
    return _dataSource.logout();
  }
}
