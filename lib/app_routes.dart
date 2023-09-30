import 'package:coredumpedapp/screens/login_screen.dart';
import 'package:coredumpedapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
  ];
}
