import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_app/lineChart.dart';
import 'package:flutter_app/pricePoints.dart';



class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Chart"),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Center(
      child: Container(
        child: LineChartWidget(pricePoints),
      ),
    );
  }
}