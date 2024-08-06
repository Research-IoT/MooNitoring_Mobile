import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/models.dart';
import '../../../utils/utils.dart';
import '../../../routes/app_pages.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = Get.put(HomeController());

  @override
  void initState() {
    _controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      bottomNavigationBar: ConvexAppBar(
        top: 0,
        height: 60,
        color: AppColor.black,
        activeColor: AppColor.green,
        backgroundColor: AppColor.white,
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.home, title: ''),
          TabItem(icon: Icons.analytics, title: ''),
          TabItem(icon: Icons.notifications, title: ''),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => Utils.changePage(index: i),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                  ),
                )
              : SafeArea(
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      height: Get.height * 0.9,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Selamat ${_controller.timeNow.value}',
                                        style: body2.copyWith(
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        _controller.name!,
                                        style: paragraph2.copyWith(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => showCustomDialog(context),
                                    child: Container(
                                      height: 50,
                                      width: 135,
                                      decoration: BoxDecoration(
                                          color: AppColor.green,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color.fromARGB(
                                                      255, 124, 214, 127)
                                                  .withOpacity(0.4),
                                              spreadRadius: 2,
                                              blurRadius: 100,
                                              offset: const Offset(0, 1),
                                            ),
                                          ]),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          AppText(
                                            text: _controller.role!,
                                            left: 5,
                                            style: paragraph2.copyWith(
                                              color: AppColor.white,
                                            ),
                                          ),
                                          Container(
                                            width: 40,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.white,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                size: 30,
                                                Icons.person,
                                                color: AppColor.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: Get.width * 1,
                              height: Get.height / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.green,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppText(
                                      text: 'Lokasi Sekarang',
                                      style: paragraph2.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    AppText(
                                      text: _controller.city.value,
                                      style: paragraph3.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    AppText(
                                      text: _controller.temperature.value,
                                      style: body1.copyWith(
                                        fontSize: 30,
                                        color: AppColor.white,
                                      ),
                                    ),
                                    AppText(
                                      text: _controller.weather.value,
                                      style: paragraph3.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppText(
                                          text:
                                              'H:${_controller.humidity.value}',
                                          style: paragraph3.copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                        AppText(
                                          left: 10,
                                          text:
                                              'L:${_controller.pressure.value}',
                                          style: paragraph3.copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 1,
                              child: AppText(
                                top: 40,
                                bottom: 20,
                                text: 'Daftar Perangkat',
                                style: body1,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            FutureBuilder<List<DataListDevices>?>(
                              future: _controller.fetchDevices(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return SizedBox(
                                    height: Get.height * 0.5,
                                    child: const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColor.green,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return SizedBox(
                                    height: Get.height * 0.5,
                                    child: Center(
                                      child: Text('Error: ${snapshot.error}'),
                                    ),
                                  );
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return SizedBox(
                                    height: Get.height * 0.5,
                                    child: const Center(
                                      child: Center(
                                        child: Text('No devices found'),
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox(
                                    height: Get.height * 0.5,
                                    child: ListView(
                                      children: snapshot.data!.map((device) {
                                        return ListDevices(
                                          height: 100,
                                          width: Get.width * 1,
                                          deviceName: device.name!,
                                          deviceTemperature:
                                              device.dashboard!.temperature!,
                                          deviceHumidity:
                                              device.dashboard!.humidity!,
                                          deviceAmmonia:
                                              device.dashboard!.ammonia!,
                                          onTap: () => Get.toNamed(
                                            Routes.DETAIL,
                                            arguments: {'idDevices': device.id},
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: Get.height * 0.2,
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        top: 2,
                                        text: _controller.name!,
                                        style: paragraph1.copyWith(
                                          color: AppColor.white,
                                        ),
                                      ),
                                      AppText(
                                        top: 10,
                                        text: _controller.noHp!,
                                        style: paragraph2.copyWith(
                                            color: AppColor.white),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: AppText(
                                          top: 5,
                                          maxLines: 2,
                                          text: _controller.address!,
                                          style: paragraph3.copyWith(
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AppButtonPrimary(
                    width: Get.width * 1,
                    height: Get.height * 0.05,
                    btnColor: AppColor.red,
                    text: 'Keluar',
                    onPressed: () async {
                      await _controller.doLogout();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
