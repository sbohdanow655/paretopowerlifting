import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'dart:collection';

import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

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
    List<Widget> workoutDays = [];

    _dailyPrescription.toTupleList().forEach((tuple) {    
      if (tuple.exercise == Exercise.Rest) {
        workoutDays.add(Text(tuple.prescriptionString));
      } else {
        workoutDays.add(Row(children: [
          Text(tuple.prescriptionString),
          Checkbox(
            value: prescriptionPassMap[tuple.exercise],
            onChanged: (isChecked) => (prescriptionPassMap[tuple.exercise] = isChecked )
          )
        ]));
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: workoutDays 
      );

  }
}