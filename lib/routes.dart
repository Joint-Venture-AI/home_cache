import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:home_cache/view/auth/login/login_screen.dart';
import 'package:home_cache/view/auth/onboarding_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_type_of_house_screen.dart';
import 'package:home_cache/view/auth/signup/signup_screen.dart';
import 'package:home_cache/view/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboard = '/onboard';
  static const login = '/login';
  static const signup = '/signup';
  static const selectHouse = '/select-house';

  static final pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboard, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: selectHouse, page: () => const SelectTypeOfHouseScreen()),
  ];
}
