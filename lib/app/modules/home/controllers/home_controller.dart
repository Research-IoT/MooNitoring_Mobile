import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'home_service.dart';
import '../../../routes/app_pages.dart';
import '../../../data/prefs/prefs.dart';

class HomeController extends GetxController {
  final idS = Prefs.getInt(Prefs.id);
  final nameS = "Nero";
  final tokenS = Prefs.getString(Prefs.token);

  final _homeServices = HomeService(Dio());

  String timeNow = '';

  void changePage({
    required int index,
  }) {
    debugPrint('changePage: $index');
    switch (index) {
      case 0:
        break;
      case 1:
        Get.toNamed(Routes.PROFILE);
        break;
      case 2:
        break;
      case 3:
        break;
      default:
    }
  }

  void getTimeNow() {
    int time = 0;
    debugPrint('getTimeNow : $time');

    if (time >= 00 && time <= 10) {
      timeNow = 'Pagi';
    } else if (time >= 11 && time <= 14) {
      timeNow = 'Siang';
    } else if (time >= 15 && time <= 18) {
      timeNow = 'Sore';
    } else if (time >= 19 && time <= 24) {
      timeNow = 'Malam';
    } else {
      timeNow = 'No Time';
    }
  }

  // void getListKandang() async {
  //   final result = await _homeServices.listKandang(tokenS, idS);

  //   debugPrint(tokenS);

  //   result.fold(
  //     (l) {
  //       debugPrint('fail get data : ${l.message}');
  //     },
  //     (r) {
  //       debugPrint('data : ${r.data}');
  //       return result;
  //     },
  //   );
  // }
}
