import 'dart:collection';

import 'package:pareto_powerlifting/classes/DailyExercisePresciption.dart';
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

  static List<DailyExercisePrescription> getThisWeeksWorkouts() {

    List<DailyExercisePrescription> dailyPrescriptionList = [];
    
    bool is3day = Settings.state.squatPhaseNumber <= 2 || Settings.state.deadliftPhaseNumber <= 2 || Settings.state.benchPressPhaseNumber <= 2;

    if (is3day) {
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody1));
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody2));
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody3));

    } else {
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody1));
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody1));
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody2));
      dailyPrescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody2));

    }

    return dailyPrescriptionList;
  }  
}