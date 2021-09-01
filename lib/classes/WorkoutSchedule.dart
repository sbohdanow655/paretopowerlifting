import 'dart:collection';

import 'package:pareto_powerlifting/classes/GetDailyPrescriptions.dart';

import './SingleExercisePrescription.dart';

enum Weekday {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

enum WorkoutType {
  LowerBody1,
  LowerBody2,
  UpperBody1,
  UpperBody2,
  FullBody1,
  FullBody2,
  FullBody3
}

class WorkoutSchedule {

  WorkoutSchedule();

  List<List<SingleExercisePrescription>> getThisWeeksWorkouts(bool is3day) {
    HashMap<WorkoutType, List<SingleExercisePrescription>> prescriptionMap = GetDailyPrescriptions.getDailyPrescriptions(workoutType, phaseNumberMap, startingWeightMap, weightUnit);

    List<List<SingleExercisePrescription>> prescriptionList = [];
    
    if (is3day) {
      prescriptionList.add(prescriptionMap[WorkoutType.FullBody1]);
      prescriptionList.add(prescriptionMap[WorkoutType.FullBody2]);
      prescriptionList.add(prescriptionMap[WorkoutType.FullBody3]);

    } else {
      prescriptionList.add(prescriptionMap[WorkoutType.LowerBody1]);
      prescriptionList.add(prescriptionMap[WorkoutType.UpperBody1]);
      prescriptionList.add(prescriptionMap[WorkoutType.LowerBody2]);
      prescriptionList.add(prescriptionMap[WorkoutType.UpperBody2]);
    }

    return prescriptionList;
  }

  HashMap<WorkoutType, List<SingleExercisePrescription>> getPrescriptions() {

  }

  HashMap<WorkoutType, List<SingleExercisePrescription>> getDailyPrescriptions() {}
  
}