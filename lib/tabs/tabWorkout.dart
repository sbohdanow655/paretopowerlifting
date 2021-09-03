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

  Map<Weekday, Map<Exercise, bool>> _passFailMap = {};

  @override
  Widget build(BuildContext context) {

    Map<Weekday, IDailyPrescription> workoutPrescriptionsByDay = Settings.getInstance().getThisWeeksWorkouts();

    List<Widget> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(workoutPrescriptionsByDay[weekday],  weekday, _passFailMap);
      workoutDayList.add(workoutDay);
      
      Exercise.values.forEach((exercise) {
        _passFailMap[weekday][exercise] = false;
      });
    });

    workoutDayList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text(Constants.finishWorkoutAndAddWeight),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
            Settings.getInstance().finishWorkoutAndIncrementWeight(_passFailMap);
          })
        ]
    ));

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