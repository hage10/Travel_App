import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../core/constants/colors_contants.dart';
import '../../../core/constants/dismesion_constant.dart';
import '../../../core/constants/textstyle_constants.dart';
import '../../../data/models/ChartModel.dart';

class ColumnChartItem extends StatefulWidget {
  const ColumnChartItem(
      {super.key,
      required this.height,
      required this.title,
      required this.data});
  final double height;
  final String title;
  final List<ChartData> data;

  @override
  State<ColumnChartItem> createState() => _ColumnChartItemState();
}

class _ColumnChartItemState extends State<ColumnChartItem> {
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kMinPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  widget.title,
                  style: TextStyles.defaultStyle.bold,
                ),
                const Spacer(),
                const Icon(Icons.calendar_month_rounded)
              ],
            ),
          ),
          const SizedBox(
            height: kMinPadding,
          ),
          SizedBox(
            height: widget.height,
            child: SfCartesianChart(
              zoomPanBehavior: ZoomPanBehavior(
                enablePinching: true, // Cho phép thu phóng bằng cách pinch
                enablePanning: true, // Cho phép di chuyển bằng cách kéo
              ),
              plotAreaBorderWidth: 0, // bỏ viền biểu đồ
              backgroundColor: Colors.white,
              primaryXAxis: const CategoryAxis(
                axisLine: AxisLine(width: 0), // Ẩn đường kẻ trục X
                majorGridLines: MajorGridLines(width: 0), // ẩn lưới trục x
                labelStyle:
                    TextStyle(color: ColorPalette.subTitleColor), //màu chữ
              ), //categoryAxis chỉ định rằng trục X sẽ hiển thị các loại danh mục (categories) thay vì các giá trị số.
              primaryYAxis: const NumericAxis(
                axisLine: AxisLine(width: 0), // Ẩn đường kẻ trục Y
                minimum: 0, //giá trị nhỏ nhất trên trục Y là 0.
                interval:
                    5, //khoảng cách giữa các giá trị trên trục Y là 10 đơn vị.
                labelStyle:
                    TextStyle(color: ColorPalette.subTitleColor), //màu chữ
              ),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<ChartData, String>>[
                ColumnSeries<ChartData, String>(
                  animationDuration: 500,
                  dataSource: widget.data, // nguồn dữ liệu
                  xValueMapper: (ChartData data, _) =>
                      data.x, // ánh xạ giá trị trục x đến data.x
                  yValueMapper: (ChartData data, _) =>
                      data.y, // ánh xạ giá trị trục y đến data.y
                  name: 'Gold',
                  color: const Color(0xffFB7046),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                  width: 0.5, // độ rộng cột, từ 0-1
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
