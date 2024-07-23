import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../data/prefs/prefs.dart';

class ProfileController extends GetxController {
  // final name = Prefs.getString(Prefs.name);
  // final email = Prefs.getString(Prefs.email);

  void doLogout() {
    debugPrint('logout sucess!');
    Get.snackbar('SmarFeeding', 'Logout Berhasil!');

    // Prefs.setString(Prefs.email, 'email');
    // Prefs.setString(Prefs.name, 'name');
    // Prefs.setString(Prefs.token, 'token');

    Prefs.setLogin(Prefs.login, false);

    Get.offNamed(Routes.LOGIN);
  }
}
