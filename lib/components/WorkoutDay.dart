import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DailyExercisePresciption.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'dart:collection';
import '../classes/SingleExercisePrescription.dart';

class WorkoutDay extends StatefulWidget {
  WorkoutDay(this._dailyPrescription);

  final IDailyPrescription _dailyPrescription;

  @override
  State<StatefulWidget> createState() {
    return _WorkoutDayState(this._dailyPrescription);
  }
}

class _WorkoutDayState extends State<WorkoutDay> {
  _WorkoutDayState(this._dailyPrescription);
  
  final IDailyPrescription _dailyPrescription;

  HashMap prescriptionPassMap = new HashMap<int, bool>();

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _prescriptionList.map((prescription) { 
        return Row(children: [
          Text(prescription.toString()),
          Checkbox(
            value: prescriptionPassMap[prescription.exercise],
            onChanged: (isChecked) => (prescriptionPassMap[prescription.exercise] = isChecked )
            )
        ]);
      }).toList()
    );

  }
}