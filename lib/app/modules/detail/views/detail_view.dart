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
  void initState() {
    _controller.getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return _controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleContainer(
                              color: AppColor.green,
                              name: '${_controller.humidity} RH',
                              desc: 'Kelembapan',
                            ),
                            const SizedBox(width: 10),
                            CircleContainer(
                              color: AppColor.blue,
                              height: 125,
                              width: 125,
                              name: '${_controller.temperature} °C',
                              sizeName: 24,
                              desc: 'Suhu',
                              sizeDesc: 14,
                            ),
                            const SizedBox(width: 10),
                            CircleContainer(
                              color: AppColor.orange,
                              name: '${_controller.ammonia} ppm',
                              desc: 'Amonia',
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        ToggleOnOff(
                          height: 100,
                          width: Get.width * 1,
                          icPath: icAutomatic,
                          isToggled: _controller.automatic,
                          name: 'Otomatis',
                          desc:
                              'Fitur ini akan menjalankan device sesuai dengan yang sudah di atur',
                          valueChanged: (value) {
                            setState(() async {
                              _controller.automatic = value;

                              if (_controller.automatic == true) {
                                _controller.manual = false;

                                _controller.blower = false;
                                _controller.heater = false;
                              } else {
                                _controller.manual = true;

                                _controller.blower = false;
                                _controller.heater = false;
                              }
                              _controller.changeController();
                            });
                          },
                        ),
                        const SizedBox(height: 50),
                        ToggleOnOff(
                          height: 100,
                          width: Get.width * 1,
                          icPath: icLamp,
                          isToggled: _controller.heater,
                          isSwitchEnabled: _controller.manual,
                          name: 'Pemanas',
                          desc:
                              'Dengan menyalakan ini akan memberikan kehangatan kepada kandang',
                          valueChanged: (value) {
                            setState(() {
                              _controller.heater = value;
                              _controller.changeController();
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        ToggleOnOff(
                          height: 100,
                          width: Get.width * 1,
                          icPath: icFan,
                          isToggled: _controller.blower,
                          isSwitchEnabled: _controller.manual,
                          name: 'Blower',
                          desc:
                              'Dengan menyalakan ini akan memberikan hawa dingin kepada kandang',
                          valueChanged: (value) {
                            setState(() {
                              _controller.blower = value;
                              _controller.changeController();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
        }),
      ),
    );
  }
}
