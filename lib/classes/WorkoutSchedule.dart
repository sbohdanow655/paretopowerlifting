import 'dart:collection';

import 'package:pareto_powerlifting/classes/DailyExercisePresciption.dart';
import 'package:pareto_powerlifting/classes/DailyRestPrescription.dart';
import 'package:pareto_powerlifting/classes/GetDailyPrescriptions.dart';
import 'IDailyPrescription.dart';
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

  static HashMap<Weekday, DailyExercisePrescription> getThisWeeksWorkouts() {

    HashMap<Weekday, IDailyPrescription> dailyPrescriptionMap = new HashMap();
    
    bool is3day = Settings.state.squatPhaseNumber <= 2 || Settings.state.deadliftPhaseNumber <= 2 || Settings.state.benchPressPhaseNumber <= 2;

    HashMap<Weekday, WorkoutType> schedule = is3day ? Settings.state.threeDaySchedule : Settings.state.fourDaySchedule;

    Weekday.values.forEach((weekday) {
      if (schedule.containsKey(weekday)) {
        dailyPrescriptionMap[weekday] = GetDailyPrescriptions.getDailyPrescriptions(schedule[weekday]);
      } else {
        dailyPrescriptionMap[weekday] = new DailyRestPrescription();
      }
    });

    return dailyPrescriptionMap;
  }  
}