import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/themes.dart';
import '../../../utils/constant.dart';
import '../../../widgets/widgets.dart';
import '../controllers/detail_controller.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            height: Get.height * 0.9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: SizedBox(
                          child: Center(
                            child: Image.asset(
                              icBack,
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width * 0.2),
                      AppText(
                        text: 'Kontrol Perangkat',
                        style: body2,
                      ),
                      const Spacer()
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleContainer(
                        color: AppColor.green,
                        name: '76.70 RH',
                        desc: 'Kelembapan',
                      ),
                      const SizedBox(width: 10),
                      CircleContainer(
                        color: AppColor.blue,
                        height: 125,
                        width: 125,
                        name: '28 °C',
                        sizeName: 24,
                        desc: 'Suhu',
                        sizeDesc: 14,
                      ),
                      const SizedBox(width: 10),
                      CircleContainer(
                        color: AppColor.orange,
                        name: '80 ppm',
                        desc: 'Amonia',
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  ToggleOnOff(
                    height: 100,
                    width: Get.width * 1,
                    icPath: icAutomatic,
                    isToggled: _controller.otomatic,
                    name: 'Otomatis',
                    desc:
                        'Fitur ini akan menjalankan device sesuai dengan yang sudah di atur',
                    valueChanged: (value) {
                      setState(() {
                        _controller.otomatic = value;

                        if (_controller.otomatic == true) {
                          _controller.manual = false;

                          _controller.fan = false;
                          _controller.lamp = false;
                        } else {
                          _controller.manual = true;

                          _controller.fan = false;
                          _controller.lamp = false;
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  ToggleOnOff(
                    height: 100,
                    width: Get.width * 1,
                    icPath: icFan,
                    isToggled: _controller.fan,
                    isSwitchEnabled: _controller.manual,
                    name: 'Kipas',
                    desc:
                        'Dengan menyalakan ini akan memberikan hawa dingin kepada kandang',
                    valueChanged: (value) {
                      setState(() {
                        _controller.fan = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ToggleOnOff(
                    height: 100,
                    width: Get.width * 1,
                    icPath: icLamp,
                    isToggled: _controller.lamp,
                    isSwitchEnabled: _controller.manual,
                    name: 'Lampu',
                    desc:
                        'Dengan menyalakan ini akan memberikan kehangatan kepada kandang',
                    valueChanged: (value) {
                      setState(() {
                        _controller.lamp = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
