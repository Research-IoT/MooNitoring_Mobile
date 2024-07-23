import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          TabItem(icon: Icons.person, title: ''),
          // TabItem(icon: Icons.tab, title: ''),
          // TabItem(icon: Icons.map, title: ''),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => _controller.changePage(index: i),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: Get.width * 0.9,
              height: Get.height * 0.9,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                            text: 'Bandung',
                            style: paragraph3.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          AppText(
                            text: '21°C',
                            style: body1.copyWith(
                              fontSize: 30,
                              color: AppColor.white,
                            ),
                          ),
                          AppText(
                            text: 'Sebagian Berawan',
                            style: paragraph3.copyWith(
                              color: AppColor.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText(
                                text: 'H:92',
                                style: paragraph3.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                              AppText(
                                left: 10,
                                text: 'L:20',
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
                      top: 20,
                      bottom: 20,
                      text: 'Daftar Perangkat',
                      style: body1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.DETAIL),
                    child: Container(
                      height: 100,
                      width: Get.width * 1,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 10),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: 'Titik A',
                                  style: body1,
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: '28.0°C',
                                            style: body2.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          AppText(
                                            text: 'Suhu',
                                            style: paragraph3.copyWith(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: '76.70 RH',
                                            style: body2.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          AppText(
                                            text: 'Kelembaban',
                                            style: paragraph3.copyWith(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 50),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AppText(
                                            text: '80 ppm',
                                            style: body2.copyWith(
                                              fontSize: 12,
                                            ),
                                          ),
                                          AppText(
                                            text: 'Anomia',
                                            style: paragraph3.copyWith(
                                              fontSize: 10,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
