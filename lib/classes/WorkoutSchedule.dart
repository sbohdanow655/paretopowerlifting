import 'dart:collection';

import 'package:pareto_powerlifting/classes/DailyExercisePresciption.dart';
import 'package:pareto_powerlifting/classes/DailyRestPrescription.dart';
import 'package:pareto_powerlifting/classes/GetDailyPrescriptions.dart';
import 'package:pareto_powerlifting/tabs/tabWorkout.dart';
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
  FullBody3,
  RestDay
}

class WorkoutSchedule {

  WorkoutSchedule();

  static HashMap<Weekday, IDailyPrescription> getThisWeeksWorkouts() {

    HashMap<Weekday, IDailyPrescription> dailyPrescriptionMap = new HashMap();
    
    bool is3day = Settings.state.is3day();

    Weekday.values.forEach((weekday) {
      if (is3day) {
        if (Settings.state.threeDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = GetDailyPrescriptions.getDailyPrescriptions(Settings.state.getThreeDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      } else {
        if (Settings.state.fourDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = GetDailyPrescriptions.getDailyPrescriptions(Settings.state.getFourDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      }

    });

    return dailyPrescriptionMap;
  }  
}