import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
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

    Map<Weekday, IDailyPrescription> workoutPrescriptionsByDay = Settings.getInstance().getThisWeeksWorkouts();


    List<WorkoutDay> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(workoutPrescriptionsByDay[weekday],  weekday);
      workoutDayList.add(workoutDay);
    });

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: const Color(0xfff5f5f5),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: workoutDayList 
          )
      )
    );
  }
}