import 'package:get/get.dart';
import '../../features/auth/screens/welcome_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/password_screen.dart';
import '../../features/auth/screens/create_account_screen.dart';
import '../../features/auth/bindings/auth_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/password',
      page: () => const PasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: '/create-account',
      page: () => const CreateAccountScreen(),
      binding: AuthBinding(),
    ),
  ];
}