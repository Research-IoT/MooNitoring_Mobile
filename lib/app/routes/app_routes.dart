part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const HOME = _Paths.HOME;
  static const DETAIL = _Paths.DETAIL;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const LOGIN = _Paths.LOGIN;
  static const ANALYTICS = _Paths.ANALYTICS;
  static const NOTIFICATIONS = _Paths.NOTIFICATIONS;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH_SCREEN = '/splash_screen';
  static const HOME = '/home';
  static const DETAIL = '/detail';
  static const ONBOARDING = '/auth/onboarding';
  static const LOGIN = '/login';
  static const ANALYTICS = '/analytics';
  static const NOTIFICATIONS = '/notifications';

}
