import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/PassFail.dart';
import 'package:pareto_powerlifting/classes/Phases.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'package:pareto_powerlifting/classes/ExerciseLog.dart';

import 'DailyExercisePresciption.dart';
import 'DailyRestPrescription.dart';
import 'IDailyPrescription.dart';

class WeeklyExercisePrescription {
  Map<Weekday, DailyExercisePrescription> _presciptionCache = {};

  Phases _phases = Phases();

  set squatPhase(val) {
    _phases.squat = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_SQUAT, val);
  }

  get squatPhase {
    return _phases.squat;
  }

  set benchPressPhase(val) {
    _phases.benchPress = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_BENCHPRESS, val);
  }

  get benchPressPhase {
    return _phases.benchPress;
  }

  set deadliftPhase(val) {
    _phases.deadlift = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_DEADLIFT, val);
  }

  get deadliftPhase {
    return _phases.deadlift;
  }

  Map<Exercise, String> _weightMap = {
    Exercise.Squat: "45",
    Exercise.BenchPress: "45",
    Exercise.Deadlift: "45",
    Exercise.OverheadPress: "45",
    Exercise.PendlayRow: "45",
    Exercise.Skullcrushers: "45",
  };

  PassFail _passFail = PassFail();
  String _weightUnit = Constants.WEIGHTUNIT_LBS;
  bool _haveMicroplates = false;
  bool _enableCurls = false;
  bool _enableHIITConditioning = false;

  set forceFourDaySplit(val) {
    _phases.forceFourDay = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_FORCEFOURDAYSPLIT, val);
  }

  get enableHIITConditioning {
    return _enableHIITConditioning;
  }

  set enableHIITConditioning(val) {
    _enableHIITConditioning = val;
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_OPTIONAL_HIITCONDITIONING, val);
  }

  get enableCurls {
    return _enableCurls;
  }

  set enableCurls(val) {
    _enableCurls = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_OPTIONAL_CURLS, val);
  }

  get forceFourDaySplit {
    return _phases.forceFourDay;
  }

  set weightUnit(val) {
    _weightUnit = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_WEIGHT_UNIT, val);
  }

  get weightUnit {
    return _weightUnit;
  }

  set haveMicroplates(val) {
    _haveMicroplates = val;
    DBHelper.saveSettingToDB(Constants.SettingsDB_HAVE_MICROPLATES, val);
  }

  get haveMicroplates {
    return _haveMicroplates;
  }

  void resetExercisePhases() {
    _passFail.reset();
    _phases.reset();
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_SQUAT, _phases.squat);
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_BENCHPRESS, _phases.benchPress);
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_DEADLIFT, _phases.deadlift);
  }

  set passFail(val) {
    _passFail = val;
  }

  get passFail {
    return _passFail;
  }

  WeeklyExercisePrescription();

  Map<WorkoutType, Weekday> _fourDaySchedule = {
    WorkoutType.LowerBody1: Weekday.Monday,
    WorkoutType.UpperBody1: Weekday.Tuesday,
    WorkoutType.LowerBody2: Weekday.Thursday,
    WorkoutType.UpperBody2: Weekday.Friday
  };

  Map<WorkoutType, Weekday> _threeDaySchedule = {
    WorkoutType.FullBody1: Weekday.Monday,
    WorkoutType.FullBody2: Weekday.Wednesday,
    WorkoutType.FullBody3: Weekday.Friday
  };

  bool isThreeDayWorkoutType(WorkoutType workoutType) {
    return _threeDaySchedule.containsKey(workoutType);
  }

  bool isFourDayWorkoutType(WorkoutType workoutType) {
    return _fourDaySchedule.containsKey(workoutType);
  }

  String getNextWeight(Exercise exercise) {
    return _weightMap[exercise];
  }

  void setNextWeight(Exercise exercise, String weightString) {
    if (weightString.isEmpty) {
      return;
    }
    _weightMap[exercise] = weightString;
    switch (exercise) {
      case Exercise.Squat:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_SQUAT, weightString);
        break;
      case Exercise.BenchPress:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_BENCHPRESS, weightString);
        break;
      case Exercise.Deadlift:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_DEADLIFT, weightString);
        break;
      case Exercise.OverheadPress:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_OVERHEADPRESS, weightString);
        break;
      case Exercise.PendlayRow:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_PENDLAYROW, weightString);
        break;
      case Exercise.Skullcrushers:
        DBHelper.saveSettingToDB(
            Constants.SettingsDB_WEIGHT_SKULLCRUSHERS, weightString);
        break;
      default:
        break;
    }
  }

  String getSinglePassFail(Weekday weekday, Exercise exercise) {
    return _passFail.getSinglePassFail(weekday, exercise);
  }

  void setSinglePassFail(Weekday weekday, Exercise exercise, String passFail) {
    _passFail.setSinglePassFail(weekday, exercise, passFail);
  }

  void setThreeDayWorkoutDay(WorkoutType workoutType, Weekday weekday) {
    _threeDaySchedule[workoutType] = weekday;

    switch (workoutType) {
      case WorkoutType.FullBody1:
        DBHelper.saveSettingToDB(Constants.SettingsDB_FULLBODY_ONE, weekday);
        break;
      case WorkoutType.FullBody2:
        DBHelper.saveSettingToDB(Constants.SettingsDB_FULLBODY_TWO, weekday);
        break;
      case WorkoutType.FullBody3:
        DBHelper.saveSettingToDB(Constants.SettingsDB_FULLBODY_THREE, weekday);
        break;
      default:
        break;
    }
  }

  void setFourDayWorkoutDay(WorkoutType workoutType, Weekday weekday) {
    _fourDaySchedule[workoutType] = weekday;

    switch (workoutType) {
      case WorkoutType.LowerBody1:
        DBHelper.saveSettingToDB(Constants.SettingsDB_LOWERBODY_ONE, weekday);
        break;
      case WorkoutType.UpperBody1:
        DBHelper.saveSettingToDB(Constants.SettingsDB_UPPERBODY_ONE, weekday);
        break;
      case WorkoutType.LowerBody2:
        DBHelper.saveSettingToDB(Constants.SettingsDB_LOWERBODY_TWO, weekday);
        break;
      case WorkoutType.UpperBody2:
        DBHelper.saveSettingToDB(Constants.SettingsDB_UPPERBODY_TWO, weekday);
        break;
      default:
        break;
    }
  }

  Weekday getWeekdayFromWorkoutType(WorkoutType workoutType) {
    if (_threeDaySchedule.containsKey(workoutType)) {
      return _threeDaySchedule[workoutType];
    }

    return _fourDaySchedule[workoutType];
  }

  String getDayTwoWeight(Exercise exercise, WorkoutType dayOneWorkoutType) {
    bool didFailDayOne = getSinglePassFail(
            getWeekdayFromWorkoutType(dayOneWorkoutType), exercise) ==
        Constants.FAIL;
    return didFailDayOne
        ? _weightMap[exercise]
        : incrementWeight(_weightMap[exercise], exercise);
  }

  String getDayThreeWeight(Exercise exercise, WorkoutType dayOneWorkoutType,
      WorkoutType dayTwoWorkoutType) {
    bool didFailDayOne = getSinglePassFail(
            getWeekdayFromWorkoutType(dayOneWorkoutType), exercise) ==
        Constants.FAIL;
    bool didFailDayTwo = getSinglePassFail(
            getWeekdayFromWorkoutType(dayTwoWorkoutType), exercise) ==
        Constants.FAIL;

    String weight = _weightMap[exercise];

    bool didFailOnlyDayOne = didFailDayOne && !didFailDayTwo;
    bool didFailOnlyDayTwo = !didFailDayOne && didFailDayTwo;

    if (didFailOnlyDayOne || didFailOnlyDayTwo) {
      weight = incrementWeight(weight, exercise);
    }

    if (!didFailDayOne && !didFailDayTwo) {
      weight = incrementWeightTwice(weight, exercise);
    }

    return weight;
  }

  IDailyPrescription getDailyPrescriptionByWeekday(Weekday weekday) {
    WorkoutType workoutType = _getWorkoutTypeFromWeekday(weekday);
    bool isInSchedule = (_phases.isThreeDay() &&
            _threeDaySchedule.containsKey(workoutType)) ||
        (!_phases.isThreeDay() && _fourDaySchedule.containsKey(workoutType));

    IDailyPrescription dailyPrescription = isInSchedule
        ? _getDailyPrescription(workoutType)
        : DailyRestPrescription();

    if (dailyPrescription.runtimeType == DailyExercisePrescription) {
      _presciptionCache[weekday] = dailyPrescription;
    }

    return dailyPrescription;
  }

  IDailyPrescription _getDailyPrescription(WorkoutType workoutType) {
    List<SingleExercisePrescription> prescriptionList = [];

    switch (workoutType) {
      case WorkoutType.FullBody1:
        prescriptionList.add(new SingleExercisePrescription(
            Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress,
            _weightMap[Exercise.BenchPress], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift,
            _weightMap[Exercise.Deadlift], _weightUnit, 1, 5));

        if (_enableCurls) {
          prescriptionList.add(new SingleExercisePrescription(Exercise.Curls,
              Constants.EMPTYSTRING, Constants.EMPTYSTRING, 3, 10));
        }

        break;
      case WorkoutType.FullBody2:
        switch (_phases.squat) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                getDayTwoWeight(Exercise.Squat, WorkoutType.FullBody1),
                _weightUnit,
                3,
                5));
            break;
          default:
            break;
        }

        switch (_phases.benchPress) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                getDayTwoWeight(Exercise.BenchPress, WorkoutType.FullBody1),
                _weightUnit,
                3,
                5));
            break;
          default:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _weightMap[Exercise.OverheadPress],
                _weightUnit,
                3,
                5));
            break;
        }

        switch (_phases.deadlift) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                getDayTwoWeight(Exercise.Deadlift, WorkoutType.FullBody1),
                _weightUnit,
                1,
                5));
            break;
          default:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                _weightMap[Exercise.PendlayRow],
                _weightUnit,
                3,
                8));
            break;
        }

        break;
      case WorkoutType.FullBody3:
        switch (_phases.squat) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                getDayThreeWeight(Exercise.Squat, WorkoutType.FullBody1,
                    WorkoutType.FullBody2),
                _weightUnit,
                3,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                getDayTwoWeight(Exercise.Squat, WorkoutType.FullBody1),
                _weightUnit,
                3,
                5));
            break;
          default:
            break;
        }

        switch (_phases.benchPress) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                getDayThreeWeight(Exercise.BenchPress, WorkoutType.FullBody1,
                    WorkoutType.FullBody2),
                _weightUnit,
                3,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                getDayTwoWeight(Exercise.BenchPress, WorkoutType.FullBody1),
                _weightUnit,
                3,
                5));

            break;
          default:
            break;
        }

        switch (_phases.deadlift) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                getDayThreeWeight(Exercise.Deadlift, WorkoutType.FullBody1,
                    WorkoutType.FullBody2),
                _weightUnit,
                1,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                getDayTwoWeight(Exercise.Deadlift, WorkoutType.FullBody1),
                _weightUnit,
                1,
                5));
            break;
          default:
            break;
        }

        if (_enableCurls) {
          prescriptionList.add(new SingleExercisePrescription(Exercise.Curls,
              Constants.EMPTYSTRING, Constants.EMPTYSTRING, 3, 10));
        }

        break;
      case WorkoutType.LowerBody1:
        switch (_phases.squat) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 3));
            break;
        }

        switch (_phases.deadlift) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                _weightMap[Exercise.Deadlift],
                _weightUnit,
                1,
                5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                _getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.Deadlift], false),
                _weightUnit,
                2,
                5));
            break;
        }

        if (_enableHIITConditioning) {
          prescriptionList.add(new SingleExercisePrescription(
              Exercise.HIITConditioning,
              Constants.EMPTYSTRING,
              Constants.EMPTYSTRING,
              5,
              0));
        }

        break;
      case WorkoutType.UpperBody1:
        switch (_phases.benchPress) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                _weightMap[Exercise.BenchPress],
                _weightUnit,
                3,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                _weightMap[Exercise.PendlayRow],
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _weightMap[Exercise.OverheadPress],
                _weightUnit,
                3,
                5));

            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                _weightMap[Exercise.BenchPress],
                _weightUnit,
                5,
                3));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                _weightMap[Exercise.PendlayRow],
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _weightMap[Exercise.OverheadPress],
                _weightUnit,
                5,
                3));

            break;
          case 4:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                _weightMap[Exercise.BenchPress],
                _weightUnit,
                3,
                3));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.OverheadPress], _haveMicroplates),
                _weightUnit,
                5,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                _weightMap[Exercise.PendlayRow],
                _weightUnit,
                3,
                8));

            break;
        }

        if (_enableCurls) {
          prescriptionList.add(new SingleExercisePrescription(Exercise.Curls,
              Constants.EMPTYSTRING, Constants.EMPTYSTRING, 3, 10));
        }

        break;
      case WorkoutType.LowerBody2:
        switch (_phases.squat) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                getDayTwoWeight(Exercise.Squat, WorkoutType.LowerBody1),
                _weightUnit,
                3,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                getDayTwoWeight(Exercise.Squat, WorkoutType.LowerBody1),
                _weightUnit,
                3,
                5));
            break;
          default:
            break;
        }

        switch (_phases.deadlift) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                getDayTwoWeight(Exercise.Deadlift, WorkoutType.LowerBody1),
                _weightUnit,
                1,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                getDayTwoWeight(Exercise.Deadlift, WorkoutType.LowerBody1),
                _weightUnit,
                1,
                5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                _weightMap[Exercise.Deadlift],
                _weightUnit,
                2,
                3));
        }
        if (_phases.squat == 3) {
          prescriptionList.add(new SingleExercisePrescription(
              Exercise.Squat,
              _getVolumeDayWeightFromIntensityDay(
                  _weightMap[Exercise.Squat], false),
              _weightUnit,
              5,
              5));
        }

        if (_enableHIITConditioning) {
          prescriptionList.add(new SingleExercisePrescription(
              Exercise.HIITConditioning,
              Constants.EMPTYSTRING,
              Constants.EMPTYSTRING,
              5,
              0));
        }

        break;
      case WorkoutType.UpperBody2:
        switch (_phases.benchPress) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                getDayTwoWeight(Exercise.BenchPress, WorkoutType.UpperBody1),
                _weightUnit,
                3,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                getDayTwoWeight(Exercise.PendlayRow, WorkoutType.UpperBody1),
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                getDayTwoWeight(Exercise.OverheadPress, WorkoutType.UpperBody1),
                _weightUnit,
                3,
                5));

            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                getDayTwoWeight(Exercise.BenchPress, WorkoutType.UpperBody1),
                _weightUnit,
                5,
                3));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                getDayTwoWeight(Exercise.PendlayRow, WorkoutType.UpperBody1),
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                getDayTwoWeight(Exercise.OverheadPress, WorkoutType.UpperBody1),
                _weightUnit,
                5,
                3));

            break;
          case 4:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _weightMap[Exercise.OverheadPress],
                _weightUnit,
                3,
                3));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                _getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.BenchPress], _haveMicroplates),
                _weightUnit,
                5,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Skullcrushers,
                _weightMap[Exercise.Skullcrushers],
                _weightUnit,
                3,
                8));

            break;
        }

        if (_enableCurls) {
          prescriptionList.add(new SingleExercisePrescription(Exercise.Curls,
              Constants.EMPTYSTRING, Constants.EMPTYSTRING, 3, 10));
        }

        break;
      case WorkoutType.RestDay:
        return DailyRestPrescription();
        break;
      default:
        break;
    }

    return DailyExercisePrescription(prescriptionList);
  }

  String incrementWeight(String weight, Exercise exercise) {
    double weightIncrement;
    bool isUpperBody = exercise == Exercise.BenchPress ||
        exercise == Exercise.OverheadPress ||
        exercise == Exercise.PendlayRow ||
        exercise == Exercise.Skullcrushers;
    bool isBenchPressPhase3 = _phases.benchPress >= 3;
    bool useMicroplates = _haveMicroplates && isUpperBody && isBenchPressPhase3;
    if (useMicroplates) {
      if (_weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (_weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }

    double newWeight = double.parse(weight) + weightIncrement;

    return _getFormattedWeightString(newWeight.toString());
  }

  static String _getFormattedWeightString(String weight) {
    double weightAsDouble = double.parse(weight);
    return weightAsDouble % 1 == 0
        ? weightAsDouble.toStringAsFixed(0)
        : weightAsDouble.toStringAsFixed(1);
  }

  String incrementWeightTwice(String weight, Exercise exercise) {
    return incrementWeight(incrementWeight(weight, exercise), exercise);
  }

  String _getVolumeDayWeightFromIntensityDay(
      String intensityDayWeight, bool useMicroplates) {
    double weight = double.parse(intensityDayWeight);
    double weightIncrement;
    if (useMicroplates) {
      if (_weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (_weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }
    double newWeight =
        (0.8 * weight / weightIncrement).round() * weightIncrement;
    return _getFormattedWeightString(newWeight.toString());
  }

  void _advanceWeights() {
    bool squatWeightIncrementOnce = _phases.squat == 3;
    bool benchPressWeightIncrementOnce = _phases.benchPress == 4;
    bool deadliftWeightIncrementOnce = _phases.deadlift == 3;
    bool overheadPressWeightIncrementOnce = _phases.benchPress == 4;

    Weekday.values.forEach((weekday) {
      Exercise.values.forEach((exercise) {
        if (_passFail.getSinglePassFail(weekday, exercise) == Constants.PASS) {
          String nextWeight = _weightMap[exercise];
          switch (exercise) {
            case Exercise.Squat:
              if (squatWeightIncrementOnce) {
                squatWeightIncrementOnce = false;
              } else {
                nextWeight = incrementWeight(nextWeight, exercise);
              }
              break;
            case Exercise.BenchPress:
              if (benchPressWeightIncrementOnce) {
                benchPressWeightIncrementOnce = false;
              } else {
                nextWeight = incrementWeight(nextWeight, exercise);
              }
              break;
            case Exercise.Deadlift:
              if (deadliftWeightIncrementOnce) {
                deadliftWeightIncrementOnce = false;
              } else {
                nextWeight = incrementWeight(nextWeight, exercise);
              }
              break;
            case Exercise.OverheadPress:
              if (overheadPressWeightIncrementOnce) {
                overheadPressWeightIncrementOnce = false;
              } else {
                nextWeight = incrementWeight(nextWeight, exercise);
              }
              break;
            default:
              nextWeight = incrementWeight(nextWeight, exercise);
              break;
          }

          setNextWeight(exercise, nextWeight);
        }
      });
    });
  }

  void _advancePhases() {
    Set<Exercise> exerciseFailureSet = {};
    Iterable<Weekday> weekdays = _phases.isThreeDay()
        ? _threeDaySchedule.values
        : _fourDaySchedule.values;

    weekdays.forEach((weekday) {
      if (!exerciseFailureSet.contains(Exercise.Squat) &&
          _passFail.getSinglePassFail(weekday, Exercise.Squat) ==
              Constants.FAIL) {
        exerciseFailureSet.add(Exercise.Squat);
        switch (_phases.squat) {
          case 1:
            if (_phases.forceFourDay) {
              _phases.squat = 3;
            } else {
              _phases.squat = 2;
            }
            break;
          case 2:
            _phases.squat = 3;
            break;
          default:
            break;
        }
      }

      if (!exerciseFailureSet.contains(Exercise.BenchPress) &&
          _passFail.getSinglePassFail(weekday, Exercise.BenchPress) ==
              Constants.FAIL) {
        exerciseFailureSet.add(Exercise.BenchPress);
        switch (_phases.benchPress) {
          case 1:
            if (_phases.forceFourDay) {
              _phases.benchPress = 3;
            } else {
              _phases.benchPress = 2;
            }
            break;
          case 2:
            _phases.benchPress = 3;
            break;
          case 3:
            _phases.benchPress = 4;
            break;
          default:
            break;
        }
      }

      if (!exerciseFailureSet.contains(Exercise.Deadlift) &&
          _passFail.getSinglePassFail(weekday, Exercise.Deadlift) ==
              Constants.FAIL) {
        exerciseFailureSet.add(Exercise.Deadlift);
        switch (_phases.deadlift) {
          case 1:
            if (_phases.forceFourDay) {
              _phases.deadlift = 3;
            } else {
              _phases.deadlift = 2;
            }
            break;
          case 2:
            _phases.deadlift = 3;
            break;
          default:
            break;
        }
      }
    });

    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_SQUAT, _phases.squat);
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_BENCHPRESS, _phases.benchPress);
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_DEADLIFT, _phases.deadlift);
  }

  WorkoutType _getWorkoutTypeFromWeekday(Weekday weekday) {
    WorkoutType workoutType;

    if (_phases.isThreeDay()) {
      _threeDaySchedule.forEach((WorkoutType wT, Weekday w) {
        if (w == weekday) {
          workoutType = wT;
        }
      });
    } else {
      _fourDaySchedule.forEach((WorkoutType wT, Weekday w) {
        if (w == weekday) {
          workoutType = wT;
        }
      });
    }

    return workoutType;
  }

  void _emptyPresciptionCache() {
    _presciptionCache = {};
  }

  void _savePrescriptionsAndPassFailsToDB() {
    _presciptionCache
        .forEach((Weekday weekday, IDailyPrescription dailyPrescription) {
      if (dailyPrescription.runtimeType == DailyExercisePrescription) {
        Map<String, String> passFails =
            _passFail.getPassFailsFromWeekday(weekday);
        passFails.forEach((String exerciseString, String passFail) {
          bool didPass = passFail == Constants.PASS;
          dailyPrescription
              .toTupleList()
              .forEach((ExercisePrescriptionTuple tuple) {
            ExerciseLog prescription =
                ExerciseLog.fromSingleExercisePrescription(
                    tuple.singleExercisePrescription, didPass);
            DBHelper.insertExerciseLog(prescription);
          });
        });
      }
    });
  }

  void advanceWeek() {
    _savePrescriptionsAndPassFailsToDB();
    _emptyPresciptionCache();
    _advancePhases();
    _advanceWeights();
    _passFail.reset();
  }
}
