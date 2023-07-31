import 'package:clean_architecture/src/ui/auth/login/login_screen.dart';
import 'package:clean_architecture/src/ui/auth/register/register_screen.dart';
import 'package:clean_architecture/src/ui/home/home_screen.dart';
import 'package:clean_architecture/src/ui/main/splash_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router() {
    return GoRouter(
      initialLocation:SplashScreen.routeName ,
      routes: [
        GoRoute(
          path: SplashScreen.routeName,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RegisterScreen.routeName,
          builder: (context, state) => const RegisterScreen(),
        ),
      ],
    );
  }
}
