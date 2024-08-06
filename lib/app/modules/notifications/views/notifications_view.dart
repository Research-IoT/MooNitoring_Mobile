import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonitoring/app/widgets/widgets.dart';

import '../../../data/models/models.dart';
import '../../../themes/themes.dart';
import '../../../utils/utils.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final _controller = Get.put(NotificationsController());

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
          TabItem(icon: Icons.analytics, title: ''),
          TabItem(icon: Icons.notifications, title: ''),
        ],
        initialActiveIndex: 2,
        onTap: (int i) => Utils.changePage(index: i),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Center(
              child: FutureBuilder<List<ListDataNotif>?>(
                future: _controller.getNotifications(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: Get.height * 1,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColor.green,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return SizedBox(
                      height: Get.height * 1,
                      child: Center(
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return SizedBox(
                      height: Get.height * 1,
                      child: const Center(
                        child: Center(
                          child: Text('Tidak Ada Notifikasi'),
                        ),
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height * 0.5,
                      child: ListView(
                        children: snapshot.data!.map((el) {
                          debugPrint(el.title!);

                          return ListNotif(
                            title: Text(el.title!),
                            description: Text(el.description!),
                            date: Text(el.date!),
                            time: Text(el.time!),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
