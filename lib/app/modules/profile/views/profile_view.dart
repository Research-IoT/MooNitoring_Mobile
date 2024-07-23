import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../themes/themes.dart';
import '../../../utils/constant.dart';
import '../../../widgets/widgets.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: Get.width * 0.9,
            height: Get.height * 0.9,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: Get.height * 0.15,
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
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.white,
                                  ),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    image: AssetImage(people),
                                    fit: BoxFit.scaleDown,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      top: 2,
                                      text: 'Nero Demonic',
                                      style: paragraph1.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                                    AppText(
                                      top: 4,
                                      text: '07381263',
                                      style: paragraph2.copyWith(
                                          color: AppColor.white),
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: AppText(
                                        top: 2,
                                        text:
                                            'RT.04/RW.01, Sibang Kaja, Kec. Kalijati, Kabupaten Subang, Jawa Barat 41271',
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
                  onPressed: () => _controller.doLogout(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
