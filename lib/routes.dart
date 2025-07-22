import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:home_cache/view/auth/onboarding_screen.dart';
import 'package:home_cache/view/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboard = '/onboard';

  static final pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboard, page: () => const OnboardingScreen()),
  ];
}
