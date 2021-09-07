import 'dart:convert';

import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';

import 'Settings.dart';

class PassFail {
  Map<String, Map<String, bool>> _passFailMap = {};

  PassFail() {
    _passFailMap = _getInitialPassFailMap();
  }

  @override
  String toString() {
    return json.encode(_passFailMap);
  }

  void setSinglePassFail(Weekday weekday, Exercise exercise, bool didPass) {
    _passFailMap[weekday.toString()][exercise.toString()] = didPass;
  }

  bool getSinglePassFail(Weekday weekday, Exercise exercise) {
    return _passFailMap[weekday.toString()][exercise.toString()];
  }

  void setFromString(String passFailJson) {
    Map<String, Map<String, bool>> passFailMap = _getInitialPassFailMap();
    Map<String, dynamic> decodedJson1 = json.decode(passFailJson);
    decodedJson1.forEach((String weekdayString, dynamic passFailByExercise) {
      passFailByExercise.forEach((String exerciseString, dynamic didPass) {
        passFailMap[weekdayString][exerciseString] = didPass;
      });
    });
    _passFailMap = passFailMap;
  }

  Map<String, Map<String, bool>> _getInitialPassFailMap() {
    Map<String, Map<String, bool>> passFailMap = {};
    Weekday.values.forEach((weekday) {
      passFailMap[weekday.toString()] = {};
      Exercise.values.forEach((exercise) {
        passFailMap[weekday.toString()][exercise.toString()] = false;
      });
    });

    return passFailMap;
  }

  void finishWorkoutAndIncrementWeight(Settings settings) {
    Set<Exercise> checkedExerciseSet = new Set();

    _passFailMap.forEach((weekdayString, dailyPassFailMap) {
      dailyPassFailMap.forEach((exerciseString, didPass) {
        Exercise exercise = Constants.exerciseByToString[exerciseString];
        if (didPass) {
          settings.setNextWeight(
              exercise,
              Settings.incrementWeight(
                      settings.getNextWeight(exercise), exercise, settings)
                  .toString());
        } else if (!checkedExerciseSet.contains(exercise)) {
          switch (exercise) {
            case Exercise.Squat:
              switch (settings.phases.squat) {
                case 1:
                  settings.phases.squat = 2;
                  break;
                case 2:
                  settings.phases.squat = 3;
                  break;
                default:
                  break;
              }
              DBHelper.saveSettingToDB(settings, Constants.DB_PHASE_SQUAT);
              break;
            case Exercise.BenchPress:
              switch (settings.phases.benchPress) {
                case 1:
                  settings.phases.benchPress = 2;
                  break;
                case 2:
                  settings.phases.benchPress = 3;
                  break;
                case 3:
                  settings.phases.benchPress = 4;
                  break;
                default:
                  break;
              }
              DBHelper.saveSettingToDB(settings, Constants.DB_PHASE_BENCHPRESS);
              break;
            case Exercise.Deadlift:
              switch (settings.phases.deadlift) {
                case 1:
                  settings.phases.deadlift = 2;
                  if (settings.phases.benchPress == 1) {
                    settings.phases.benchPress = 2;
                  }
                  break;
                case 2:
                  settings.phases.deadlift = 3;
                  if (settings.phases.benchPress == 1) {
                    settings.phases.benchPress = 2;
                  }
                  break;
                default:
                  break;
              }
              DBHelper.saveSettingToDB(settings, Constants.DB_PHASE_DEADLIFT);
              break;
            default:
              break;
          }
        }
        checkedExerciseSet.add(exercise);
      });
    });

    _passFailMap = _getInitialPassFailMap();
    DBHelper.savePassFailMapToDB(this);
  }
}
