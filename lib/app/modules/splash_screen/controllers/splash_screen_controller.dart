import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../data/prefs/prefs.dart';

class SplashScreenController extends GetxController {
  void movePage() async {
    final isFirstTime = Prefs.getFirstTime();
    final isLogin = Prefs.getLogin();
  
    debugPrint('isFirstTime = $isFirstTime');
    debugPrint('isLogin = $isLogin');
  
    if (isFirstTime) {
      await Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(Routes.ONBOARDING),
      );
    }
  
    if (isLogin) {
      await Future.delayed(
        const Duration(seconds: 3),
        () => Get.offNamed(Routes.HOME),
      );
    }
  
    await Future.delayed(
      const Duration(seconds: 3),
      () => Get.offNamed(Routes.LOGIN),
    );
  }

  // void movePage() async {
  //   await Future.delayed(
  //     const Duration(seconds: 2),
  //     () => Get.offNamed(Routes.ONBOARDING),
  //   );
  // }
}
