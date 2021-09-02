import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DailyExercisePresciption.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class WorkoutTab extends StatefulWidget {
  WorkoutTab();

  @override
  State<StatefulWidget> createState() {
    return _WorkoutTabState();
  }
}

class _WorkoutTabState extends State<WorkoutTab> {

  @override
  Widget build(BuildContext context) {

    HashMap<Weekday, IDailyPrescription> workoutPrescriptionsByDay = WorkoutSchedule.getThisWeeksWorkouts();


    List<WorkoutDay> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(workoutPrescriptionsByDay[weekday], weekday);
      workoutDayList.add(workoutDay);
    });

    return SingleChildScrollView(
      child: Row(
        children: [
          Column(
            children: workoutDayList 
          )
        ]
      )
    );
  }
}