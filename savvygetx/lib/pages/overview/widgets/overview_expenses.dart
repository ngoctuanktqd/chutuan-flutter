import 'package:flutter/material.dart';
import 'package:savvygetx/managers/controllers/overview_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewExpenses extends StatelessWidget {
  const OverviewExpenses({
    super.key,
    required this.controller,
  });

  final OverviewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: const Text(
                'EXPENSES',
                style: TextStyle(
                  color: Color(0xFF8B8B8B),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            controller.state.dataChart.isNotEmpty
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      SfCircularChart(
                        // Chart title
                        // Enable legend
                        legend: Legend(isVisible: false),
                        // enableSideBySideSeriesPlacement: false,
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CircularSeries>[
                          DoughnutSeries(
                            name: '12/2023',
                            dataSource: controller.state.dataChart,
                            xValueMapper: (datum, index) => datum.name,
                            yValueMapper: (datum, index) => datum.value,
                            pointColorMapper: (datum, index) => datum.color,
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: false,
                            ),
                            innerRadius: '80%',
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF7178),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const Text(
                              '\$410',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'LIFESTYLE',
                              style: TextStyle(
                                color: Color(0xFF5B5B5B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
