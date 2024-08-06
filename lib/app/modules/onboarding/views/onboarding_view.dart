import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../themes/themes.dart';
import '../../../utils/constant.dart';

import '../controllers/onboarding_controller.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Selamat Datang\ndi Moo Nitoring',
              body:
                  'Jelajahi kemudahan peternakan modern dengan Aplikasi Kandang Pintar. '
                  'Dengan tampilan yang atraktif dan panduan yang intuitif. Dalam sekejap, '
                  'kandangmu akan terhubung cerdas di setiap genggaman!',
              image: _buildImage(first),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              title: 'Integrasi Sensor dan Kontroler',
              body:
                  'integrasi sensor dan kontroler kandangmu. Desain yang intuitif '
                  'memandu penghubungan perangkat pintar dengan kandang secara mudah.'
                  ' Pemantauan suhu, dan kelembapan udara dengan mudah dan efisien!',
              image: _buildImage(second),
              decoration: _pageDecoration(),
            ),
            PageViewModel(
              title: 'Optimalkan Pengaturan Harian',
              body:
                  'Hadir untuk memaksimalkan pengaturan harian kandang. Dari penjadwalan '
                  'pakan hingga pemantauan kesehatan hewan, pelajari cara menggunakan fitur'
                  ' canggih aplikasi.',
              image: _buildImage(third),
              decoration: _pageDecoration(),
            ),
          ],
          done:
              Text('Mulai', style: paragraph2.copyWith(color: AppColor.green)),
          onDone: () async => await _controller.toLogin(),
          next: Text(
            'Selanjutnya',
            style: paragraph2.copyWith(color: AppColor.green),
          ),
          dotsDecorator: const DotsDecorator(
            activeColor: AppColor.green,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Center(
        child: Image.asset(
          path,
          height: Get.height * 0.8,
          width: Get.width * 0.8,
        ),
      ),
    );
  }

  PageDecoration _pageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: semibold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 14,
        color: AppColor.ashGrey,
        fontWeight: regular,
      ),
    );
  }
}
