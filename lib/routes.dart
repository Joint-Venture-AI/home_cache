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
import 'package:home_cache/view/home/account/profilesetting/edit_contact_information_screen.dart';
import 'package:home_cache/view/home/account/profilesetting/privacy_policy_screen.dart';
import 'package:home_cache/view/home/account/profilesetting/profile_setting_screen.dart';
import 'package:home_cache/view/home/account/profilesetting/terms_of_use_screen.dart';
import 'package:home_cache/view/home/account/subscription/billing_address_screen.dart';
import 'package:home_cache/view/home/account/subscription/card_info_screen.dart';
import 'package:home_cache/view/home/account/subscription/subscription_screen.dart';
import 'package:home_cache/view/home/bottom_nav_bar.dart';
import 'package:home_cache/view/home/chat/chat_screen.dart';
import 'package:home_cache/view/home/details/documents/add_documents_details_screen.dart';
import 'package:home_cache/view/home/details/documents/add_documents_screen.dart';
import 'package:home_cache/view/home/details/documents/documents_details_screen.dart';
import 'package:home_cache/view/home/details/documents/documents_screen.dart';
import 'package:home_cache/view/home/details/documents/preview_document_screen.dart';
import 'package:home_cache/view/home/details/provider/add_provider_screen.dart';
import 'package:home_cache/view/home/details/provider/provider_details_screen.dart';
import 'package:home_cache/view/home/details/room/add_new_room_iteam_screen.dart';
import 'package:home_cache/view/home/details/room/add_room_screen.dart';
import 'package:home_cache/view/home/details/room/edit_room_details_screen.dart';
import 'package:home_cache/view/home/details/room/room_screen.dart';
import 'package:home_cache/view/home/details/type/appliances/appliances_screen.dart';
import 'package:home_cache/view/home/details/type/appliances/add_appliances_screen.dart';
import 'package:home_cache/view/home/details/type/appliances/edit_appliances_screen.dart';
import 'package:home_cache/view/home/details/type/view_by_type_screen.dart';
import 'package:home_cache/view/home/home/home_health_screen.dart';
import 'package:home_cache/view/home/details/provider/provider_screen.dart';
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
  static const chat = '/chat';
  static const provider = '/provider';
  static const providerDetails = '/provider-details';
  static const addProvider = '/add-provider';
  static const documents = '/documents';
  static const addDocuments = '/add-documents';
  static const previewDocument = '/preview-document';
  static const addDocumentsDetails = '/add-documents-details';
  static const documentsDetails = '/documents-details';
  static const viewByType = '/view-by-type';
  static const appliances = '/appliances';
  static const addAppliances = '/add-appliances';
  static const editAppliances = '/edit-appliances';
  static const room = '/room';
  static const addRoom = '/add-room';
  static const editRoomDetails = '/edit-room-details';
  static const addNewRoomIteam = '/add-new-room-iteam';
  static const subscription = '/subscription';
  static const billingAddress = '/billing-address';
  static const cardInfo = '/card-info';
  static const profileSetting = '/profile-setting';
  static const privacyPolicy = '/privacy-policy';
  static const termsOfUse = '/terms-of-use';
  static const editContactInfo = '/edit-contact-info';

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
    GetPage(name: chat, page: () => const ChatScreen()),
    GetPage(name: provider, page: () => const ProviderScreen()),
    GetPage(name: providerDetails, page: () => const ProviderDetailsScreen()),
    GetPage(name: addProvider, page: () => const AddProviderScreen()),
    GetPage(name: documents, page: () => const DocumentsScreen()),
    GetPage(name: addDocuments, page: () => const AddDocumentsScreen()),
    GetPage(name: previewDocument, page: () => const PreviewDocumentScreen()),
    GetPage(
      name: addDocumentsDetails,
      page: () => const AddDocumentsDetailsScreen(),
    ),
    GetPage(name: documentsDetails, page: () => const DocumentsDetailsScreen()),
    GetPage(name: viewByType, page: () => const ViewByTypeScreen()),
    GetPage(name: appliances, page: () => const AppliancesScreen()),
    GetPage(name: addAppliances, page: () => const AddAppliancesScreen()),
    GetPage(name: editAppliances, page: () => const EditAppliancesScreen()),
    GetPage(name: room, page: () => const RoomScreen()),
    GetPage(name: addRoom, page: () => const AddRoomScreen()),
    GetPage(name: editRoomDetails, page: () => const EditRoomDetailsScreen()),
    GetPage(name: addNewRoomIteam, page: () => const AddNewRoomIteamScreen()),
    GetPage(name: subscription, page: () => const SubscriptionScreen()),
    GetPage(name: billingAddress, page: () => const BillingAddressScreen()),
    GetPage(name: cardInfo, page: () => const CardInfoScreen()),
    GetPage(name: profileSetting, page: () => const ProfileSettingScreen()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfUse, page: () => const TermsOfUseScreen()),
    GetPage(
      name: editContactInfo,
      page: () => const EditContactInformationScreen(),
    ),
  ];
}
