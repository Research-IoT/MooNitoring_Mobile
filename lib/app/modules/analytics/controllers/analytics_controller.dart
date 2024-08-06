import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonitoring/app/routes/app_pages.dart';

import '../../../themes/themes.dart';
import 'analytics_service.dart';
import '../../../data/models/models.dart';

class AnalyticsController extends GetxController {
  final _serviceAnalytics = AnalyticsServices(Dio());

  RxBool isLoading = true.obs;

  final _startDate = TextEditingController();
  final _endDate = TextEditingController();

  final _date = TextEditingController();
  final _month = TextEditingController();
  final _year = TextEditingController();

  final List<ChartModels> chartTemperature = <ChartModels>[];
  final List<ChartModels> chartHumidity = <ChartModels>[];
  final List<ChartModels> chartAmmonia = <ChartModels>[];

  void clearData() {
    chartTemperature.clear();
    chartHumidity.clear();
    chartAmmonia.clear();

    if (chartTemperature.isNotEmpty &&
        chartHumidity.isNotEmpty &&
        chartAmmonia.isNotEmpty) {
      return clearData();
    }
  }

  void showSelectionDialog() {
    Get.defaultDialog(
      title: 'Pilih Waktu',
      titleStyle:
          const TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
      backgroundColor: Colors.white,
      titlePadding: const EdgeInsets.only(top: 20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Harian'),
            onTap: () {
              Get.back();
              showDailyDialog();
            },
          ),
          ListTile(
            title: const Text('Mingguan'),
            onTap: () {
              Get.back();
              showWeeklyDialog();
            },
          ),
          ListTile(
            title: const Text('Bulanan'),
            onTap: () {
              Get.back();
              showMonthlyDialog();
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.toNamed(Routes.HOME);
          },
          child: const Text(
            'Batal',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
      ],
    );
  }

  void showDailyDialog() {
    Get.defaultDialog(
      title: 'Data Harian',
      titleStyle:
          const TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _date,
              decoration: const InputDecoration(
                hintText: 'Tanggal',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _month,
              decoration: const InputDecoration(
                hintText: 'Bulan',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _year,
              decoration: const InputDecoration(
                hintText: 'Tahun',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            showSelectionDialog();
          },
          child: const Text(
            'Kembali',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await getDayly(_date.text, _month.text, _year.text);
          },
          child: const Text(
            'Pilih',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
      ],
    );
  }

  void showWeeklyDialog() {
    Get.defaultDialog(
      title: 'Data Mingguan',
      titleStyle:
          const TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _startDate,
              decoration: const InputDecoration(
                hintText: 'Tanggal Mulai',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _endDate,
              decoration: const InputDecoration(
                hintText: 'Tanggal Akhir',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _month,
              decoration: const InputDecoration(
                hintText: 'Bulan',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _year,
              decoration: const InputDecoration(
                hintText: 'Tahun',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            showSelectionDialog();
          },
          child: const Text(
            'Kembali',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await getWeekly(
                _startDate.text, _endDate.text, _month.text, _year.text);
          },
          child: const Text(
            'Pilih',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
      ],
    );
  }

  void showMonthlyDialog() {
    Get.defaultDialog(
      title: 'Pilih Bulan',
      titleStyle:
          const TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
      titlePadding: const EdgeInsets.all(16.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _month,
              decoration: const InputDecoration(
                hintText: 'Bulan',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              controller: _year,
              decoration: const InputDecoration(
                hintText: 'Tahun',
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            showSelectionDialog();
          },
          child: const Text(
            'Kembali',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await getMonthly(_month.text, _year.text);
          },
          child: const Text(
            'Pilih',
            style: TextStyle(
              color: AppColor.green,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> getDayly(
    final day,
    final month,
    final year,
  ) async {
    try {
      final result = await _serviceAnalytics.getDay(day, month, year);

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

          for (var element in r.data!) {
            chartTemperature.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.temperature!),
              ),
            );

            chartHumidity.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.humidity!),
              ),
            );

            chartAmmonia.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.ammonia!),
              ),
            );
          }
        },
      );

      isLoading.value = false;
    } catch (e) {
      debugPrint('error get data : $e');
    }
  }

  Future<void> getWeekly(
    final startDate,
    final endDate,
    final month,
    final year,
  ) async {
    try {
      final result =
          await _serviceAnalytics.getWeek(startDate, endDate, month, year);

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

          for (var element in r.data!) {
            chartTemperature.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.temperature!),
              ),
            );

            chartHumidity.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.humidity!),
              ),
            );

            chartAmmonia.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.ammonia!),
              ),
            );
          }
        },
      );

      isLoading.value = false;
    } catch (e) {
      debugPrint('error get data : $e');
    }
  }

  Future<void> getMonthly(
    final month,
    final year,
  ) async {
    try {
      final result = await _serviceAnalytics.getMonth(month, year);

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

          for (var element in r.data!) {
            chartTemperature.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.temperature!),
              ),
            );

            chartHumidity.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.humidity!),
              ),
            );

            chartAmmonia.add(
              ChartModels(
                '(${element.timestamp!})',
                double.parse(element.ammonia!),
              ),
            );
          }
        },
      );

      isLoading.value = false;
    } catch (e) {
      debugPrint('error get data : $e');
    }
  }
}
