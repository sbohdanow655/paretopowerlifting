import 'package:flutter/material.dart';
import 'dart:collection';
import '../classes/SingleExercisePrescription.dart';

class WorkoutDay extends StatefulWidget {
  WorkoutDay(this.prescriptionList);

  final List<SingleExercisePrescription> prescriptionList;

  @override
  State<StatefulWidget> createState() {
    return _WorkoutDayState(this.prescriptionList);
  }
}

class _WorkoutDayState extends State<WorkoutDay> {
  _WorkoutDayState(this.prescriptionList) {
      prescriptionList.forEach((prescription) {
        prescriptionPassMap[prescription.exercise] = false;
      });
  }

  final List<SingleExercisePrescription> prescriptionList;

  HashMap prescriptionPassMap = new HashMap<int, bool>();

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: prescriptionList.map((prescription) { 
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