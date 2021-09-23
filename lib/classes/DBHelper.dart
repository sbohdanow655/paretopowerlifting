import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/ExerciseLog.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/models/modelExerciseLog.dart';

import '../models/modelSettings.dart';
import 'PassFail.dart';

class DBHelper {
  static void insertExerciseLog(
      ExerciseLog singleExercisePrescriptionWithPassFail) {
    ExerciseLogModel.insertExerciseLog(singleExercisePrescriptionWithPassFail);
  }

  static Future<List<ExerciseLog>> getExerciseLogsFromDB(
      Exercise exercise) async {
    List<ExerciseLog> exerciseLogList = [];

    List<Map> exerciseLogsMapList =
        await ExerciseLogModel.getLogsByExercise(exercise);

    exerciseLogsMapList.forEach((exerciseLogsMap) {
      ExerciseLog exerciseLog;

      String weight;
      String weightUnit;
      int numSets;
      int numReps;
      bool didPass;

      exerciseLogsMap.forEach((dbColumn, value) {
        switch (dbColumn) {
          case Constants.ExerciseLogDB_EXERCISE:
            exercise = Constants.exerciseByToString[value];
            break;
          case Constants.ExerciseLogDB_WEIGHT:
            weight = value;
            break;
          case Constants.ExerciseLogDB_WEIGHT_UNIT:
            weightUnit = value;
            break;
          case Constants.ExerciseLogDB_SETS:
            numSets = value;
            break;
          case Constants.ExerciseLogDB_REPS:
            numReps = value;
            break;
          case Constants.ExerciseLogDB_DIDPASS:
            didPass = value == 1;
            break;
          default:
            break;
        }
      });
      exerciseLog =
          ExerciseLog(exercise, weight, weightUnit, numSets, numReps, didPass);

      exerciseLogList.add(exerciseLog);
    });

    return exerciseLogList;
  }

  static Future updateWeeklyExercisePrescriptionFromDB(
      WeeklyExercisePrescription weeklyExercisePrescription) async {
    Map settingsMap = await SettingsModel.getSettings();
    settingsMap.forEach((key, value) {
      switch (key) {
        case Constants.SettingsDB_FORCEFOURDAYSPLIT:
          weeklyExercisePrescription.forceFourDaySplit = value == 1;
          break;
        case Constants.SettingsDB_OPTIONAL_HIITCONDITIONING:
          weeklyExercisePrescription.enableHIITConditioning = value == 1;
          break;
        case Constants.SettingsDB_OPTIONAL_CURLS:
          weeklyExercisePrescription.enableCurls = value == 1;
          break;
        case Constants.SettingsDB_HAVE_MICROPLATES:
          weeklyExercisePrescription.haveMicroplates = value == 1;
          break;
        case Constants.SettingsDB_WEIGHT_UNIT:
          weeklyExercisePrescription.weightUnit = value;
          break;
        case Constants.SettingsDB_PHASE_SQUAT:
          weeklyExercisePrescription.squatPhase = value;
          break;
        case Constants.SettingsDB_PHASE_BENCHPRESS:
          weeklyExercisePrescription.benchPressPhase = value;
          break;
        case Constants.SettingsDB_PHASE_DEADLIFT:
          weeklyExercisePrescription.deadliftPhase = value;
          break;
        case Constants.SettingsDB_FULLBODY_ONE:
          weeklyExercisePrescription.setThreeDayWorkoutDay(
              WorkoutType.FullBody1, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_FULLBODY_TWO:
          weeklyExercisePrescription.setThreeDayWorkoutDay(
              WorkoutType.FullBody2, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_FULLBODY_THREE:
          weeklyExercisePrescription.setThreeDayWorkoutDay(
              WorkoutType.FullBody3, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_LOWERBODY_ONE:
          weeklyExercisePrescription.setFourDayWorkoutDay(
              WorkoutType.LowerBody1, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_UPPERBODY_ONE:
          weeklyExercisePrescription.setFourDayWorkoutDay(
              WorkoutType.UpperBody1, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_LOWERBODY_TWO:
          weeklyExercisePrescription.setFourDayWorkoutDay(
              WorkoutType.LowerBody2, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_UPPERBODY_TWO:
          weeklyExercisePrescription.setFourDayWorkoutDay(
              WorkoutType.UpperBody2, Constants.weekdayByString[value]);
          break;
        case Constants.SettingsDB_WEIGHT_SQUAT:
          weeklyExercisePrescription.setNextWeight(Exercise.Squat, value);
          break;
        case Constants.SettingsDB_WEIGHT_BENCHPRESS:
          weeklyExercisePrescription.setNextWeight(Exercise.BenchPress, value);
          break;
        case Constants.SettingsDB_WEIGHT_DEADLIFT:
          weeklyExercisePrescription.setNextWeight(Exercise.Deadlift, value);
          break;
        case Constants.SettingsDB_WEIGHT_OVERHEADPRESS:
          weeklyExercisePrescription.setNextWeight(
              Exercise.OverheadPress, value);
          break;
        case Constants.SettingsDB_WEIGHT_PENDLAYROW:
          weeklyExercisePrescription.setNextWeight(Exercise.PendlayRow, value);
          break;
        default:
          break;
      }
    });
  }

  static void saveSettingToDB(String dbColumnName, val) {
    SettingsModel.updateSetting(dbColumnName, val);
  }

  static void savePassFailMapToDB(PassFail passFail) async {
    SettingsModel.savePassFailToDB(passFail);
  }

  static Future updatePassFailFromDB(PassFail passFail) async {
    await SettingsModel.updatePassFailFromDB(passFail);
  }
}
