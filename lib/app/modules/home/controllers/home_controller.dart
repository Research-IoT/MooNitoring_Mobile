import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weather/weather.dart';

import './home_service.dart';
import '../../../routes/app_pages.dart';
import '../../../data/models/models.dart';
import '../../../data/prefs/prefs.dart';

class HomeController extends GetxController {
  final _homeServices = HomeService(Dio());

  final id = Prefs.getInt(Prefs.id);
  final name = Prefs.getString(Prefs.name);
  final noHp = Prefs.getString(Prefs.noHp);
  final address = Prefs.getString(Prefs.address);
  final role = Prefs.getString(Prefs.role);

  final apiKeyOpenWeaher = '82aba754f25242eb957e12c16fbea273';

  RxBool isLoading = true.obs;

  RxString timeNow = ''.obs;
  RxString city = ''.obs;
  RxString temperature = ''.obs;
  RxString humidity = ''.obs;
  RxString pressure = ''.obs;
  RxString weather = ''.obs;

  void getData() async {
    await openWeather();
    await getTimeNow();
    await fetchDevices();

    isLoading.value = false;
  }

  Future<void> getTimeNow() async {
    DateTime date = DateTime.now();
    int time = date.hour;

    if (time >= 00 && time <= 10) {
      timeNow.value = 'Pagi';
    } else if (time >= 11 && time <= 14) {
      timeNow.value = 'Siang';
    } else if (time >= 15 && time <= 18) {
      timeNow.value = 'Sore';
    } else if (time >= 19 && time <= 24) {
      timeNow.value = 'Malam';
    } else {
      timeNow.value = 'No Time';
    }
  }

  Future<List<DataListDevices>?> fetchDevices() async {
    try {
      final result = await _homeServices.getListDevices();

      List<DataListDevices>? data = [];

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
          data = r.data!;
        },
      );

      return data;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  Future doLogout() async {
    await logoutAuth().then((value) {
      if (value == false) {
        Get.snackbar(
          'Gagal keluar',
          'Pastikan koneksi internet anda stabil!',
        );
        return;
      }
    });

    Get.snackbar('Sampai Jumpa', 'Logout Berhasil!');
    Get.offNamed(Routes.LOGIN);
  }

  Future logoutAuth() async {
    final result = await _homeServices.logout();
    bool auth = false;

    result.fold(
      (l) {
        auth = false;
      },
      (r) async {
        Prefs.setString(Prefs.name, 'name');
        Prefs.setString(Prefs.noHp, 'noHp');
        Prefs.setString(Prefs.address, 'address');
        Prefs.setString(Prefs.token, 'token');

        Prefs.setLogin(Prefs.login, false);

        auth = true;
      },
    );

    return auth;
  }

  Future<void> openWeather() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;
    loc.Location location = loc.Location();
    loc.LocationData locationData = await location.getLocation();

    // Check if location services are enabled
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    // Check if permission is granted
    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
      return;
    }

    List<Placemark> placemarks = await placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );

    Placemark place = placemarks[0];

    double lat = locationData.latitude!;
    double lon = locationData.longitude!;

    WeatherFactory wf = WeatherFactory(
      apiKeyOpenWeaher,
      language: Language.INDONESIAN,
    );

    Weather w = await wf.currentWeatherByLocation(lat, lon);

    String temperatureStr = w.temperature.toString();
    RegExp regExp = RegExp(r'(\d+(\.\d+)?)');
    Match? match = regExp.firstMatch(temperatureStr);

    double temp = 0.0;

    if (match != null) {
      String numericValue = match.group(1)!;
      double temperature = double.parse(numericValue);
      temp = temperature;
    } else {
      debugPrint("Tidak ada nilai numerik ditemukan");
    }

    city.value = place.locality ?? "Unknown";
    temperature.value = '$temp°C';
    humidity.value = w.humidity.toString();
    pressure.value = w.pressure.toString();
    weather.value = (w.weatherDescription ?? "Unknown").toUpperCase();
  }
}
