import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../data/api/api.dart';
import '../data/prefs/prefs.dart';
import '../routes/app_pages.dart';

class Utils {
  static void changePage({
    required int index,
  }) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.HOME);
        break;
      case 1:
        Get.toNamed(Routes.ANALYTICS);
        break;
      case 2:
        Get.toNamed(Routes.NOTIFICATIONS);
        break;
      default:
        Get.toNamed(Routes.HOME);
    }
  }

  static Future<String?> ensureToken() async {
    await Prefs.init();

    String? token = Prefs.getString(Prefs.token);

    if (token == '' || token.isBlank! || token!.isEmpty) {
      await Future.delayed(
        const Duration(milliseconds: 100),
      );

      return ensureToken();
    }

    return token;
  }

  static Future<bool> checkLoginStatus() async {
    await Prefs.init();
    String? token = await ensureToken();

    if (token == null) {
      return false;
    }

    try {
      final response = await Dio().getUri(
        Uri.https(Api.baseURL, Api.versionAPI + Api.profile),
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }
}
