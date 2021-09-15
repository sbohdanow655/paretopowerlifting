import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';

import '../model.dart';
import 'PassFail.dart';

class DBHelper {
  static Future updateWeeklyExercisePrescriptionFromDB(
      WeeklyExercisePrescription weeklyExercisePrescription) async {
    Map settingsMap = await Model.getSettings();
    settingsMap.forEach((key, value) {
      switch (key) {
        case Constants.DB_HAVE_MICROPLATES:
          weeklyExercisePrescription.haveMicroplates = value == 1;
          break;
        case Constants.DB_WEIGHT_UNIT:
          weeklyExercisePrescription.weightUnit = value;
          break;
        case Constants.DB_PHASE_SQUAT:
          weeklyExercisePrescription.squatPhase = value;
          break;
        case Constants.DB_PHASE_BENCHPRESS:
          weeklyExercisePrescription.benchPressPhase = value;
          break;
        case Constants.DB_PHASE_DEADLIFT:
          weeklyExercisePrescription.deadliftPhase = value;
          break;
        case Constants.DB_FULLBODY_ONE:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.FullBody1, Constants.weekdayByString[value]);
          break;
        case Constants.DB_FULLBODY_TWO:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.FullBody2, Constants.weekdayByString[value]);
          break;
        case Constants.DB_FULLBODY_THREE:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.FullBody3, Constants.weekdayByString[value]);
          break;
        case Constants.DB_LOWERBODY_ONE:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.LowerBody1, Constants.weekdayByString[value]);
          break;
        case Constants.DB_UPPERBODY_ONE:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.UpperBody1, Constants.weekdayByString[value]);
          break;
        case Constants.DB_LOWERBODY_TWO:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.LowerBody2, Constants.weekdayByString[value]);
          break;
        case Constants.DB_UPPERBODY_TWO:
          weeklyExercisePrescription.setWorkoutDay(
              WorkoutType.UpperBody2, Constants.weekdayByString[value]);
          break;
        case Constants.DB_WEIGHT_SQUAT:
          weeklyExercisePrescription.setNextWeight(Exercise.Squat, value);
          break;
        case Constants.DB_WEIGHT_BENCHPRESS:
          weeklyExercisePrescription.setNextWeight(Exercise.BenchPress, value);
          break;
        case Constants.DB_WEIGHT_DEADLIFT:
          weeklyExercisePrescription.setNextWeight(Exercise.Deadlift, value);
          break;
        case Constants.DB_WEIGHT_OVERHEADPRESS:
          weeklyExercisePrescription.setNextWeight(
              Exercise.OverheadPress, value);
          break;
        case Constants.DB_WEIGHT_PENDLAYROW:
          weeklyExercisePrescription.setNextWeight(Exercise.PendlayRow, value);
          break;
        case Constants.DB_WEIGHT_SKULLCRUSHERS:
          weeklyExercisePrescription.setNextWeight(
              Exercise.Skullcrushers, value);
          break;
        default:
          break;
      }
    });
  }

  static void saveSettingToDB(String dbColumnName, val) {
    Model.updateSetting(dbColumnName, val);
  }

  static void savePassFailMapToDB(PassFail passFail) async {
    Model.savePassFailToDB(passFail);
  }

  static Future<PassFail> getPassFailFromDB() async {
    return await Model.getPassFailFromDB();
  }
}
