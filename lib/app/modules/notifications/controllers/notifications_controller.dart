import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moonitoring/app/data/prefs/prefs.dart';

import '../../../data/models/models.dart';
import 'notifications_service.dart';

class NotificationsController extends GetxController {
  final _notificationService = NotificationsService(Dio());

  RxBool isLoading = true.obs;
  final token = Prefs.getString(Prefs.token);

  Future<List<ListDataNotif>?> getNotifications() async {
    final result = await _notificationService.getListNotif(token);

    List<ListDataNotif>? data = [];

    result.fold(
      (l) {
        debugPrint('fail get data : ${l.message}');

        isLoading.value = false;
      },
      (r) {
        debugPrint('success get data : ${r.message}');

        data = r.data!;

        isLoading.value = false;
      },
    );
    return data;
  }
}
