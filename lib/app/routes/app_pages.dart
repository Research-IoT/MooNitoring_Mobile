import 'package:get/get.dart';
import 'package:moonitoring/app/modules/analytics/views/analytics_view.dart';
import 'package:moonitoring/app/modules/notifications/views/notifications_view.dart';

import '../modules/login/views/login_view.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      transition: Transition.fade,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.HOME,
      transition: Transition.fade,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      transition: Transition.fade,
      page: () => const OnBoardingView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      transition: Transition.fade,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      transition: Transition.fade,
      page: () => const DetailView(),
    ),
    GetPage(
      name: _Paths.ANALYTICS,
      transition: Transition.fade,
      page: () => const AnalyticsView(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      transition: Transition.fade,
      page: () => const NotificationsView(),
    ),
  ];
}
