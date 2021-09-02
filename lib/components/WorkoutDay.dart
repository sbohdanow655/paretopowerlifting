import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class WorkoutDay extends StatefulWidget {
  IDailyPrescription _dailyPrescription;
  
  WorkoutDay(this._dailyPrescription);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(this._dailyPrescription);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._dailyPrescription);

  final IDailyPrescription _dailyPrescription;

  Map<Exercise, bool> _prescriptionPassMap = {
    Exercise.Squat : false,
    Exercise.BenchPress : false,
    Exercise.Deadlift : false,
    Exercise.OverheadPress : false,
    Exercise.PendlayRow : false,
    Exercise.Skullcrushers : false,
  };

  void setPrescriptionPass(Exercise exercise, bool wasPassed) {
    setState(() {
      _prescriptionPassMap[exercise] = wasPassed;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> workoutDays = [];

    _dailyPrescription.toTupleList().forEach((tuple) {    
      if (tuple.exercise == Exercise.Rest) {
        workoutDays.add(Text(tuple.prescriptionString));
      } else {
        workoutDays.add(Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(tuple.prescriptionString),
            Checkbox(
              value: _prescriptionPassMap[tuple.exercise],
              onChanged: (isChecked) => ( setPrescriptionPass(tuple.exercise, isChecked) )
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