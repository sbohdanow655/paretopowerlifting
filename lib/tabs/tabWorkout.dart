import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

class Workout extends StatefulWidget {
  Workout();

  @override
  State<StatefulWidget> createState() {
    return _WorkoutState();
  }
}

class _WorkoutState extends State<Workout> {

  HashMap<Weekday, IDailyPrescription> workoutPrescriptionsByDay = WorkoutSchedule.getThisWeeksWorkouts();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: Weekday.values.map((weekday) {

      })
    );
  }
}