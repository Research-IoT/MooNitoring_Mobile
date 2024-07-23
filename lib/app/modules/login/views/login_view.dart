import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import '../../../themes/themes.dart';
import '../../../utils/constant.dart';

import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _controller = Get.put(LoginController());

  final _noHp = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Masuk Sekarang',
                          style: body1.copyWith(
                            fontSize: 32,
                          ),
                        ),
                        AppText(
                          text:
                              'Silakan masukkan detail dibawah untuk melanjutkan',
                          style: paragraph2.copyWith(
                            fontSize: 8,
                            color: AppColor.ashGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    child: Center(
                      child: Image.asset(
                        logo,
                        height: 200,
                        width: 180,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: Get.height * 0.25,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _noHp,
                          hintText: 'No HP',
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          controller: _password,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  AppButtonPrimary(
                    width: Get.width / 1,
                    height: Get.height / 20,
                    text: 'Masuk',
                    onPressed: () async =>
                        await _controller.checkAuth(_noHp, _password),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
