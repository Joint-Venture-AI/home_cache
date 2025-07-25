import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:home_cache/view/auth/login/login_screen.dart';
import 'package:home_cache/view/auth/onboarding_screen.dart';
import 'package:home_cache/view/auth/signup/add_details_iteam_screen.dart';
import 'package:home_cache/view/auth/signup/finish_utility_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/home_information_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_cooling_type_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_heat_power_type_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_heating_type.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_power_type.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_reponsible_type_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_type_of_house_screen.dart';
import 'package:home_cache/view/auth/signup/onboardingSignup/select_water_supply_type_screen.dart';
import 'package:home_cache/view/auth/signup/select_iteam_screen.dart';

import 'package:home_cache/view/auth/signup/signup_screen.dart';
import 'package:home_cache/view/auth/signup/track_list_screen.dart';
import 'package:home_cache/view/home/bottom_nav_bar.dart';
import 'package:home_cache/view/home/home/home_health_screen.dart';
import 'package:home_cache/view/splash_screen.dart';

class AppRoutes {
  static const splash = '/splash';
  static const onboard = '/onboard';
  static const login = '/login';
  static const signup = '/signup';
  static const selectHouse = '/select-house';
  static const homeInfo = '/home-info';
  static const selectPowerType = '/select-power-type';
  static const selectWaterSupply = '/select-water-supply';
  static const selectHeatPowerType = '/select-heat-power-type';
  static const selectCoolingType = '/select-cooling-type';
  static const selectHeatingType = '/select-heating-type';
  static const selectResponsibleType = '/select-responsible-type';
  static const finishUtility = '/finish-utility';
  static const trackList = '/track-list';
  static const selectIteam = '/select-iteam';
  static const addDetailsIteam = '/add-details-iteam';
  static const bottomNav = '/bottom-nav';
  static const homeHealth = '/home-health';

  static final pages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboard, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signup, page: () => const SignupScreen()),
    GetPage(name: selectHouse, page: () => const SelectTypeOfHouseScreen()),
    GetPage(name: homeInfo, page: () => const HomeInformationScreen()),
    GetPage(name: selectPowerType, page: () => const SelectPowerTypeScreen()),
    GetPage(
      name: selectWaterSupply,
      page: () => const SelectWaterSupplyTypeScreen(),
    ),
    GetPage(
      name: selectHeatPowerType,
      page: () => const SelectHeatPowerTypeScreen(),
    ),
    GetPage(
      name: selectCoolingType,
      page: () => const SelectCoolingTypeScreen(),
    ),
    GetPage(
      name: selectHeatingType,
      page: () => const SelectHeatingTypeScreen(),
    ),
    GetPage(
      name: selectResponsibleType,
      page: () => const SelectResponsibleTypeScreen(),
    ),
    GetPage(name: finishUtility, page: () => const FinishUtilityScreen()),
    GetPage(name: trackList, page: () => const TrackListScreen()),
    GetPage(name: selectIteam, page: () => const SelectIteamScreen()),
    GetPage(name: addDetailsIteam, page: () => const AddDetailsIteamScreen()),
    GetPage(name: bottomNav, page: () => const BottomNavBar()),
    GetPage(name: homeHealth, page: () => const HomeHealthScreen()),
  ];
}
