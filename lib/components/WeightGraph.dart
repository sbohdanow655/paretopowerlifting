import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/ExerciseLog.dart';
import 'package:fl_chart/fl_chart.dart';

class WeightGraph extends StatelessWidget {
  final List<ExerciseLog> _exerciseLogs;

  WeightGraph(this._exerciseLogs);

  @override
  Widget build(BuildContext context) {
    int logNumber = 1;
    double maxWeight = 0;

    _exerciseLogs.forEach((ExerciseLog exerciseLog) {
      double weight = double.parse(exerciseLog.weight);
      maxWeight = weight > maxWeight ? weight : maxWeight;
    });

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 300,
          width: 300,
          padding: EdgeInsets.all(10),
          child: LineChart(LineChartData(
              minX: 1,
              minY: 0,
              maxX: _exerciseLogs.length.toDouble(),
              maxY: maxWeight,
              lineBarsData: [
                LineChartBarData(
                    colors: [Colors.blue],
                    spots:
                        _exerciseLogs.reversed.map((ExerciseLog exerciseLog) {
                      return FlSpot((logNumber++).toDouble(),
                          double.parse(exerciseLog.weight));
                    }).toList())
              ])))
    ]);
  }
}
