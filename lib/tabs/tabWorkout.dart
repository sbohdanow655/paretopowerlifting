import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class Workout extends StatefulWidget {
  Workout();

  @override
  State<StatefulWidget> createState() {
    return _WorkoutState();
  }
}

class _WorkoutState extends State<Workout> {

  List<List<SingleExercisePrescription>> workoutPrescriptionsByDay = WorkoutSchedule.getThisWeeksWorkouts(weightMap, weightUnit)

  @override
  Widget build(BuildContext context) {
    
    List<List<

    return Column(
      children: [
        WorkoutDay(),
        
      ]
    );
  }
}