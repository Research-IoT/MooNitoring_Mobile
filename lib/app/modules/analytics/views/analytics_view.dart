import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/utils.dart';
import '../../../themes/themes.dart';
import '../../../data/models/models.dart';
import '../controllers/analytics_controller.dart';

class AnalyticsView extends StatefulWidget {
  const AnalyticsView({super.key});

  @override
  State<AnalyticsView> createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  final _controller = Get.put(AnalyticsController());

  @override
  void initState() {
    _controller.clearData();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.showSelectionDialog();
    });

    debugPrint(_controller.isLoading.value.toString());
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
        initialActiveIndex: 1,
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
                    child: SfCartesianChart(
                      enableAxisAnimation: true,
                      primaryXAxis: const CategoryAxis(
                        labelStyle: TextStyle(fontSize: 10),
                        maximumLabels: 100,
                        autoScrollingDelta: 150,
                        majorGridLines: MajorGridLines(width: 0),
                        majorTickLines: MajorTickLines(width: 0),
                      ),
                      zoomPanBehavior: ZoomPanBehavior(
                        enablePanning: true,
                      ),
                      legend: const Legend(
                        isVisible: true,
                        offset: Offset(100, 5),
                      ),
                      series: <CartesianSeries>[
                        SplineSeries<ChartModels, String>(
                          dataSource: _controller.chartTemperature,
                          name: 'Temperature',
                          enableTooltip: true,
                          xValueMapper: (ChartModels data, _) => data.x,
                          yValueMapper: (ChartModels data, _) => data.y,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          emptyPointSettings: const EmptyPointSettings(
                            mode: EmptyPointMode.zero,
                          ),
                        ),
                        SplineSeries<ChartModels, String>(
                          dataSource: _controller.chartHumidity,
                          name: 'Humidity',
                          enableTooltip: true,
                          xValueMapper: (ChartModels data, _) => data.x,
                          yValueMapper: (ChartModels data, _) => data.y,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          emptyPointSettings: const EmptyPointSettings(
                            mode: EmptyPointMode.zero,
                          ),
                        ),
                        SplineSeries<ChartModels, String>(
                          dataSource: _controller.chartAmmonia,
                          name: 'Ammonia',
                          enableTooltip: true,
                          xValueMapper: (ChartModels data, _) => data.x,
                          yValueMapper: (ChartModels data, _) => data.y,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          ),
                          emptyPointSettings: const EmptyPointSettings(
                            mode: EmptyPointMode.zero,
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
