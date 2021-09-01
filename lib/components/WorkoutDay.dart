import 'package:flutter/material.dart';
import 'dart:collection';
import '../classes/SingleExercisePrescription.dart';

class WorkoutDay extends StatefulWidget {
  WorkoutDay(this._prescriptionList);

  final List<SingleExercisePrescription> _prescriptionList;

  @override
  State<StatefulWidget> createState() {
    return _WorkoutDayState(this._prescriptionList);
  }
}

class _WorkoutDayState extends State<WorkoutDay> {
  _WorkoutDayState(this._prescriptionList);
  
  final List<SingleExercisePrescription> _prescriptionList;

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