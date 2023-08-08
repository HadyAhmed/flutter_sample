import 'package:injectable/injectable.dart';

@injectable
mixin UserRepo {
  Future<bool> isLoggedIn();

  Future<void> logout();
}
