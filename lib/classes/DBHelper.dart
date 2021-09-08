import 'dart:convert';

import 'package:pareto_powerlifting/assets/constants.dart';

import '../model.dart';
import 'PassFail.dart';
import 'Settings.dart';

class DBHelper {
  static Future updateSettingsFromDB(Settings settings) async {
    Map settingsMap = await Model.getSettings();
    settingsMap.forEach((key, value) {
      switch (key) {
        case Constants.DB_USE_MICROPLATES:
          settings.useMicroplates = value == 1;
          break;
        case Constants.DB_WEIGHT_UNIT:
          settings.weightUnit = value;
          break;
        case Constants.DB_PHASE_SQUAT:
          settings.squatPhase = value;
          break;
        case Constants.DB_PHASE_BENCHPRESS:
          settings.benchPressPhase = value;
          break;
        case Constants.DB_PHASE_DEADLIFT:
          settings.deadliftPhase = value;
          break;
        case Constants.DB_FULLBODY_ONE:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.FullBody1);
          break;
        case Constants.DB_FULLBODY_TWO:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.FullBody2);
          break;
        case Constants.DB_FULLBODY_THREE:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.FullBody3);
          break;
        case Constants.DB_LOWERBODY_ONE:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.LowerBody1);
          break;
        case Constants.DB_UPPERBODY_ONE:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.UpperBody1);
          break;
        case Constants.DB_LOWERBODY_TWO:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.LowerBody2);
          break;
        case Constants.DB_UPPERBODY_TWO:
          settings.addDayToSchedule(
              Constants.weekdayByString[value], WorkoutType.UpperBody2);
          break;
        case Constants.DB_WEIGHT_SQUAT:
          settings.setNextWeight(Exercise.Squat, value);
          break;
        case Constants.DB_WEIGHT_BENCHPRESS:
          settings.setNextWeight(Exercise.BenchPress, value);
          break;
        case Constants.DB_WEIGHT_DEADLIFT:
          settings.setNextWeight(Exercise.Deadlift, value);
          break;
        case Constants.DB_WEIGHT_OVERHEADPRESS:
          settings.setNextWeight(Exercise.OverheadPress, value);
          break;
        case Constants.DB_WEIGHT_PENDLAYROW:
          settings.setNextWeight(Exercise.PendlayRow, value);
          break;
        case Constants.DB_WEIGHT_SKULLCRUSHERS:
          settings.setNextWeight(Exercise.Skullcrushers, value);
          break;
        default:
          break;
      }
    });
  }

  static void saveSettingToDB(Settings settings, String dbColumnName) {
    Model.updateSetting(settings, dbColumnName);
  }

  static void savePassFailMapToDB(PassFail passFail) async {
    Model.savePassFailToDB(passFail);
  }

  static Future<PassFail> getPassFailFromDB() async {
    return await Model.getPassFailFromDB();
  }
}
