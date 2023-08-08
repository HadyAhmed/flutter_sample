import 'package:injectable/injectable.dart';

@injectable
mixin AuthenticationDataSource {
  Future<void> logout();

  Future<bool> isLoggedIn();
}
