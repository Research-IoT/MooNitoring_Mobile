import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'login_service.dart';
import '../../../routes/app_pages.dart';
import '../../../data/prefs/prefs.dart';

class LoginController extends GetxController {
  final _loginServices = LoginServices(Dio());

  Future checkAuth(
    TextEditingController noHp,
    TextEditingController password,
  ) async {
    await doLogin(noHp.text, password.text).then((value) {
      debugPrint('value : $value');

      if (value == false) {
        Get.snackbar(
          'Gagal masuk',
          'Pastikan No HP dan Password benar!',
        );
        return;
      }

      Get.snackbar('Selamat Datang', 'Login Berhasil!');
      Get.offNamed(Routes.HOME);
    });
  }

  Future doLogin(
    final noHp,
    final password,
  ) async {
    final result = await _loginServices.login(noHp, password);
    bool auth = false;

    result.fold(
      (l) {
        debugPrint('login fail! ${l.message}');

        auth = false;
      },
      (r) {
        debugPrint('login sucess!');

        Prefs.setInt(Prefs.id, r.data!.users!.id!);
        Prefs.setString(Prefs.noHp, r.data!.users!.noHp!);
        Prefs.setString(Prefs.name, r.data!.users!.name!);
        Prefs.setString(Prefs.token, r.data!.token!);

        Prefs.setLogin(Prefs.login, true);

        auth = true;
      },
    );

    debugPrint('auth : $auth');

    return auth;
  }
}
