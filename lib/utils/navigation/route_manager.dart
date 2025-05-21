import 'package:e_commerce/features/auth/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

// import '../../features/home/screens/home_screen.dart';
import '../../features/splash/view/splash_screen.dart';

class AppRouter {
  static const String defaultLocation = "/";
  static const String splash = '/splash';
  static const String home = '/home-screen';

  // Define routes
  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) =>  HomeScreen2(),
      ),
    ],
  );
}
