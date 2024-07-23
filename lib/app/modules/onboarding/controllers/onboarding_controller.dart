import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../data/prefs/prefs.dart';

class OnBoardingController extends GetxController {
  Future<void> toLogin() async {
    await Prefs.setIsFirstTime(Prefs.firstTime, false);

    await FirebaseMessaging.instance
        .subscribeToTopic('notifications-moonitoring');

    Get.offAllNamed(Routes.LOGIN);
  }
}
