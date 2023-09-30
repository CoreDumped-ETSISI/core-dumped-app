import 'package:coredumpedapp/screens/home_screen.dart';
import 'package:coredumpedapp/screens/login_screen.dart';
import 'package:coredumpedapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
    )
  ];
}
