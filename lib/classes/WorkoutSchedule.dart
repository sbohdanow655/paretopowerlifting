import 'dart:collection';

import 'package:pareto_powerlifting/classes/GetDailyPrescriptions.dart';

import './SingleExercisePrescription.dart';
import 'Settings.dart';

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

  static List<List<SingleExercisePrescription>> getThisWeeksWorkouts() {

    List<List<SingleExercisePrescription>> prescriptionList = [];
    
    bool is3day = Settings.state.squatPhaseNumber <= 2 || Settings.state.deadliftPhaseNumber <= 2 || Settings.state.benchPressPhaseNumber <= 2;

    if (is3day) {
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody1));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody2));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody3));

    } else {
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody1));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody1));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody2));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody2));

    }

    return prescriptionList;
  }  
}