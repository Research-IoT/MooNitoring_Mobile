import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonitoring/app/modules/detail/controllers/detail_service.dart';

class DetailController extends GetxController {
  final _detailServices = DetailService(Dio());

  int idDevices = Get.arguments['idDevices'];

  RxBool isLoading = true.obs;

  String temperature = '';
  String humidity = '';
  String ammonia = '';

  bool automatic = true;
  bool manual = false;
  
  bool blower = false;
  bool heater = false;

  void getData() async {
    await getDashboard();
    await getInfoControl();

    isLoading.value = false;
  }

  Future<void> getDashboard() async {
    try {
      final result = await _detailServices.dashboard(idDevices);

      result.fold(
        (l) {
          debugPrint('fail get data : ${l.message}');

          Get.snackbar(
            'Error',
            l.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        },
        (r) {
          debugPrint('success get data : ${r.message}');

          temperature = r.data!.temperature!;
          humidity = r.data!.humidity!;
          ammonia = r.data!.ammonia!;
        },
      );
    } catch (e) {
      debugPrint('error get data : $e');
    }
  }

  Future<void> getInfoControl() async {
    try {
      final result = await _detailServices.infoControl(idDevices);

      result.fold(
        (l) {
          debugPrint('fail get info control : ${l.message}');

          Get.snackbar(
            'Error',
            l.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        },
        (r) {
          debugPrint('success get info control : ${r.message}');

          automatic = r.data!.automatic!;
          blower = r.data!.blower!;
          heater = r.data!.heater!;

          if (automatic == true) {
            manual = false;
          } else {
            manual = true;
          }
        },
      );
    } catch (e) {
      debugPrint('error get info control : $e');
    }
  }

  void changeController() async {
    if (automatic == true) {
      await doAutomatic();
    } else {
      await doManual();
    }
  }

  Future<void> doAutomatic() async {
    debugPrint('doAutomatic');

    final result = await _detailServices.changeControl(
      idDevices,
      true,
      false,
      false,
    );

    result.fold(
      (l) {
        debugPrint('fail change controller : ${l.message}');
        isLoading.value = false;

        Get.snackbar(
          'Error',
          l.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (r) {
        debugPrint('success change controller : ${r.message}');
        isLoading.value = false;
      },
    );
  }

  Future<void> doManual() async {
    debugPrint('doManual');

    final result = await _detailServices.changeControl(
      idDevices,
      false,
      blower,
      heater,
    );

    result.fold(
      (l) {
        debugPrint('fail change controller : ${l.message}');
        isLoading.value = false;

        Get.snackbar(
          'Error',
          l.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      },
      (r) {
        debugPrint('success change controller : ${r.message}');
        isLoading.value = false;
      },
    );
  }
}
