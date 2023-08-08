import 'package:flutter_sample/config/router/destinations.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_screen.dart';
import 'package:flutter_sample/presentation/screens/auth/register/create_account_screen.dart';
import 'package:flutter_sample/presentation/screens/auth/reset/reset_password_screen.dart';
import 'package:flutter_sample/presentation/screens/home/home_screen.dart';
import 'package:flutter_sample/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_sample/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppRouter {
  static final _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: RouterDestination.splashScreen,
    routes: [
      GoRoute(
        path: RouterDestination.splashScreen,
        name: RouterDestination.splashScreen,
        builder: (context, state) => SplashScreen(key: state.pageKey),
      ),
      GoRoute(
        path: RouterDestination.authenticationScreen,
        name: RouterDestination.authenticationScreen,
        builder: (context, state) => AuthenticationScreen(key: state.pageKey),
        routes: [
          GoRoute(
            path: RouterDestination.createAccountScreen,
            name: RouterDestination.createAccountScreen,
            builder: (context, state) {
              return CreateAccountScreen(key: state.pageKey);
            },
          ),
          GoRoute(
            path: RouterDestination.forgotPasswordScreen,
            name: RouterDestination.forgotPasswordScreen,
            builder: (context, state) {
              return ResetPasswordScreen(key: state.pageKey);
            },
          ),
        ],
      ),
      GoRoute(
        path: RouterDestination.homeScreen,
        name: RouterDestination.homeScreen,
        builder: (context, state) => HomeScreen(key: state.pageKey),
      ),
      GoRoute(
        path: RouterDestination.profileScreen,
        name: RouterDestination.profileScreen,
        builder: (context, state) => ProfileScreen(key: state.pageKey),
      )
    ],
  );

  static GoRouter get router => _router;
}
