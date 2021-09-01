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

  static List<List<SingleExercisePrescription>> getThisWeeksWorkouts(HashMap<Exercise, int> phaseNumberMap, HashMap<Exercise, double> weightMap, String weightUnit) {

    List<List<SingleExercisePrescription>> prescriptionList = [];
    
    bool is3day = phaseNumberMap[Exercise.Squat] <= 2 || phaseNumberMap[Exercise.Deadlift] <= 2 || phaseNumberMap[Exercise.BenchPress] <= 2;

    if (is3day) {
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody1, phaseNumberMap, weightMap, weightUnit));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody2, phaseNumberMap, weightMap, weightUnit));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.FullBody3, phaseNumberMap, weightMap, weightUnit));

    } else {
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody1, phaseNumberMap, weightMap, weightUnit));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody1, phaseNumberMap, weightMap, weightUnit));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.LowerBody2, phaseNumberMap, weightMap, weightUnit));
      prescriptionList.add(GetDailyPrescriptions.getDailyPrescriptions(WorkoutType.UpperBody2, phaseNumberMap, weightMap, weightUnit));

    }

    return prescriptionList;
  }  
}