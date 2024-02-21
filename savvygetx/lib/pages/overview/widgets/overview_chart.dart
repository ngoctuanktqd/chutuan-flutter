import 'package:flutter/material.dart';
import 'package:savvygetx/managers/controllers/overview_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewChart extends StatelessWidget {
  const OverviewChart({
    super.key,
    required this.controller,
  });

  final OverviewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 10,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        child: controller.state.dataChart.isNotEmpty
            ? SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                ),
                // Chart title
                // Enable legend
                legend: Legend(isVisible: false),
                enableSideBySideSeriesPlacement: false,
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries>[
                  ColumnSeries(
                    name: '12/2023',
                    dataSource: controller.state.dataChart,
                    xValueMapper: (datum, index) => datum.name,
                    yValueMapper: (datum, index) => datum.value,
                    pointColorMapper: (datum, index) => datum.color,
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
