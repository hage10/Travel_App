import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';
import 'package:travel_app/representations/screens/chart/column_chart_item.dart';

import '../../../data/models/ChartModel.dart';

class ChartScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartScreen({super.key});
  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  // late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    // data = [
    //   _ChartData('T2', 12),
    //   _ChartData('T3', 15),
    //   _ChartData('T4', 30),
    //   _ChartData('T5', 6.4),
    //   _ChartData('T6', 14),
    //   _ChartData('T7', 14),
    //   _ChartData('CN', 14)
    // ];
    // _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              ColumnChartItem(
                data: [
                  ChartData('T2', 12),
                  ChartData('T3', 15),
                  ChartData('T4', 30),
                  ChartData('T5', 6.4),
                  ChartData('T6', 14),
                  ChartData('T7', 14),
                  ChartData('CN', 14)
                ],
                height: 300,
                title: "Thống kê giao dịch",
              ),
              const SizedBox(
                height: kBottomBarIconSize,
              ),
              ColumnChartItem(
                data: [
                  ChartData('T2', 14),
                  ChartData('T3', 17),
                  ChartData('T4', 22),
                  ChartData('T5', 15.5),
                  ChartData('T6', 12),
                  ChartData('T7', 16),
                  ChartData('CN', 20.5)
                ],
                height: 300,
                title: "Thống kê giao dịch thành công",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
