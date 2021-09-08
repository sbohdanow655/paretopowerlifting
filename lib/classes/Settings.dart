import 'package:pareto_powerlifting/classes/DBHelper.dart';

import '../assets/constants.dart';
import 'DailyExercisePresciption.dart';
import 'DailyRestPrescription.dart';
import 'IDailyPrescription.dart';
import 'PassFail.dart';
import 'Phases.dart';
import 'SingleExercisePrescription.dart';

class Settings {
  Phases _phases = Phases();
  String _weightUnit = Constants.WEIGHTUNIT_LBS;
  bool _haveMicroplates = false;

  Map<Exercise, String> _weightMap = {
    Exercise.Squat: "45",
    Exercise.BenchPress: "45",
    Exercise.Deadlift: "45",
    Exercise.OverheadPress: "45",
    Exercise.PendlayRow: "45",
    Exercise.Skullcrushers: "45",
  };

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

  Settings();

  get phases {
    return _phases;
  }

  get haveMicroplates {
    return _haveMicroplates;
  }

  void setNextWeight(Exercise exercise, String nextWeight) {
    if (nextWeight == "") {
      return;
    }
    _weightMap[exercise] = Settings.getFormattedWeightString(nextWeight);
    switch (exercise) {
      case Exercise.Squat:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_SQUAT);
        break;
      case Exercise.BenchPress:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_BENCHPRESS);
        break;
      case Exercise.Deadlift:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_DEADLIFT);
        break;
      case Exercise.OverheadPress:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_OVERHEADPRESS);
        break;
      case Exercise.PendlayRow:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_PENDLAYROW);
        break;
      case Exercise.Skullcrushers:
        DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_SKULLCRUSHERS);
        break;
      default:
        break;
    }
  }

  String getNextWeight(Exercise exercise) {
    return _weightMap[exercise];
  }

  set useMicroplates(val) {
    _haveMicroplates = val;
    DBHelper.saveSettingToDB(this, Constants.DB_USE_MICROPLATES);
  }

  set weightUnit(val) {
    _weightUnit = val;
    DBHelper.saveSettingToDB(this, Constants.DB_WEIGHT_UNIT);
  }

  set squatPhase(val) {
    _phases.squat = val;
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_SQUAT);
  }

  set benchPressPhase(val) {
    _phases.benchPress = val;
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_BENCHPRESS);
  }

  set deadliftPhase(val) {
    _phases.deadlift = val;
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_DEADLIFT);
  }

  get useMicroplates {
    return _haveMicroplates;
  }

  get weightUnit {
    return _weightUnit;
  }

  get squatPhase {
    return _phases.squat;
  }

  get benchPressPhase {
    return _phases.benchPress;
  }

  get deadliftPhase {
    return _phases.deadlift;
  }

  static String incrementWeight(
      String weight, Exercise exercise, Settings settings) {
    double weightIncrement;
    bool isUpperBody = exercise == Exercise.BenchPress ||
        exercise == Exercise.OverheadPress ||
        exercise == Exercise.PendlayRow ||
        exercise == Exercise.Skullcrushers;
    bool isBenchPressPhase3 = settings.phases.benchPress >= 3;
    bool useMicroplates =
        settings.haveMicroplates && isUpperBody && isBenchPressPhase3;
    if (useMicroplates) {
      if (settings.weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (settings.weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }

    double newWeight = double.parse(weight) + weightIncrement;

    return getFormattedWeightString(newWeight.toString());
  }

  static String getFormattedWeightString(String weight) {
    double weightAsDouble = double.parse(weight);
    return weightAsDouble % 1 == 0
        ? weightAsDouble.toStringAsFixed(0)
        : weightAsDouble.toStringAsFixed(1);
  }

  static String incrementWeightTwice(
      String weight, Exercise exercise, Settings settings) {
    return incrementWeight(
        incrementWeight(weight, exercise, settings), exercise, settings);
  }

  void resetExercisePhases() {
    _phases.reset();
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_SQUAT);
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_BENCHPRESS);
    DBHelper.saveSettingToDB(this, Constants.DB_PHASE_DEADLIFT);
  }

  static String getVolumeDayWeightFromIntensityDay(
      String intensityDayWeight, bool useMicroplates, String weightUnit) {
    double weight = double.parse(intensityDayWeight);
    double weightIncrement;
    if (useMicroplates) {
      if (weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (weightUnit == Constants.WEIGHTUNIT_LBS) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }
    double newWeight =
        (0.8 * weight / weightIncrement).round() + weightIncrement;
    return Settings.getFormattedWeightString(newWeight.toString());
  }

  Weekday getWeekdayFromWorkoutType(WorkoutType workoutType) {
    if (_fourDaySchedule.containsKey(workoutType)) {
      return _fourDaySchedule[workoutType];
    }

    return _threeDaySchedule[workoutType];
  }

  bool fourDayScheduleContainsWeekday(Weekday weekday) {
    return _fourDaySchedule.containsValue(weekday);
  }

  bool threeDayScheduleContainsWeekday(Weekday weekday) {
    return _threeDaySchedule.containsValue(weekday);
  }

  WorkoutType getFourDayWorkoutTypeFromWeekday(Weekday weekday) {
    WorkoutType workoutTypeFromWeekday;

    _fourDaySchedule.keys.forEach((workoutType) {
      if (_fourDaySchedule[workoutType] == weekday) {
        workoutTypeFromWeekday = workoutType;
      }
    });

    return workoutTypeFromWeekday;
  }

  Weekday getWeekdayFromThreeDayWorkoutType(WorkoutType workoutType) {
    return _threeDaySchedule[workoutType];
  }

  Weekday getWeekdayFromFourDayWorkoutType(WorkoutType workoutType) {
    return _fourDaySchedule[workoutType];
  }

  WorkoutType getThreeDayWorkoutTypeFromWeekday(Weekday weekday) {
    WorkoutType workoutTypeFromWeekday;

    _threeDaySchedule.keys.forEach((workoutType) {
      if (_threeDaySchedule[workoutType] == weekday) {
        workoutTypeFromWeekday = workoutType;
      }
    });

    return workoutTypeFromWeekday;
  }

  void addDayToSchedule(Weekday weekday, WorkoutType workoutType) {
    switch (workoutType) {
      case WorkoutType.FullBody1:
        _threeDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_FULLBODY_ONE);
        break;
      case WorkoutType.FullBody2:
        _threeDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_FULLBODY_TWO);
        break;
      case WorkoutType.FullBody3:
        _threeDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_FULLBODY_THREE);
        break;
      case WorkoutType.LowerBody1:
        _fourDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_LOWERBODY_ONE);
        break;
      case WorkoutType.UpperBody1:
        _fourDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_UPPERBODY_ONE);
        break;
      case WorkoutType.LowerBody2:
        _fourDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_LOWERBODY_TWO);
        break;
      case WorkoutType.UpperBody2:
        _fourDaySchedule[workoutType] = weekday;
        DBHelper.saveSettingToDB(this, Constants.DB_UPPERBODY_TWO);
        break;
      default:
        break;
    }
  }

  IDailyPrescription getDailyPrescriptions(WorkoutType workoutType) {
    List<SingleExercisePrescription> prescriptionList = [];

    switch (workoutType) {
      case WorkoutType.FullBody1:
        prescriptionList.add(new SingleExercisePrescription(
            Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress,
            _weightMap[Exercise.BenchPress], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift,
            _weightMap[Exercise.Deadlift], _weightUnit, 1, 5));

        break;
      case WorkoutType.FullBody2:
        switch (_phases.squat) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                incrementWeight(
                    _weightMap[Exercise.Squat], Exercise.Squat, this),
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
                incrementWeight(
                    _weightMap[Exercise.BenchPress], Exercise.BenchPress, this),
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
                incrementWeight(
                    _weightMap[Exercise.Deadlift], Exercise.Deadlift, this),
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
        prescriptionList.add(new SingleExercisePrescription(
            Exercise.Squat,
            incrementWeightTwice(
                _weightMap[Exercise.Squat], Exercise.Squat, this),
            _weightUnit,
            3,
            5));
        prescriptionList.add(new SingleExercisePrescription(
            Exercise.BenchPress,
            incrementWeightTwice(
                _weightMap[Exercise.BenchPress], Exercise.BenchPress, this),
            _weightUnit,
            3,
            5));
        prescriptionList.add(new SingleExercisePrescription(
            Exercise.Deadlift,
            incrementWeightTwice(
                _weightMap[Exercise.BenchPress], Exercise.BenchPress, this),
            _weightUnit,
            1,
            5));

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
                getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.Deadlift], false, _weightUnit),
                _weightUnit,
                2,
                5));
            break;
        }

        break;
      case WorkoutType.UpperBody1:
        switch (_phases.benchPress) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                _weightMap[Exercise.Deadlift],
                _weightUnit,
                3,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                _weightMap[Exercise.Deadlift],
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                _weightMap[Exercise.Deadlift],
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
                getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.OverheadPress],
                    _haveMicroplates,
                    _weightUnit),
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
        break;
      case WorkoutType.LowerBody2:
        switch (_phases.squat) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                incrementWeight(
                    _weightMap[Exercise.Squat], Exercise.Squat, this),
                _weightUnit,
                3,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Squat,
                incrementWeight(
                    _weightMap[Exercise.Squat], Exercise.Squat, this),
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
                incrementWeight(
                    _weightMap[Exercise.Deadlift], Exercise.Deadlift, this),
                _weightUnit,
                1,
                5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.Deadlift,
                incrementWeight(
                    _weightMap[Exercise.Deadlift], Exercise.Deadlift, this),
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
              getVolumeDayWeightFromIntensityDay(
                  _weightMap[Exercise.Squat], false, weightUnit),
              _weightUnit,
              5,
              5));
        }

        break;
      case WorkoutType.UpperBody2:
        switch (_phases.benchPress) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                incrementWeight(
                    _weightMap[Exercise.BenchPress], Exercise.BenchPress, this),
                _weightUnit,
                3,
                5));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                incrementWeight(
                    _weightMap[Exercise.PendlayRow], Exercise.PendlayRow, this),
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                incrementWeight(_weightMap[Exercise.OverheadPress],
                    Exercise.OverheadPress, this),
                _weightUnit,
                3,
                5));

            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.BenchPress,
                incrementWeight(
                    _weightMap[Exercise.BenchPress], Exercise.BenchPress, this),
                _weightUnit,
                5,
                3));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.PendlayRow,
                incrementWeight(
                    _weightMap[Exercise.PendlayRow], Exercise.PendlayRow, this),
                _weightUnit,
                3,
                8));
            prescriptionList.add(new SingleExercisePrescription(
                Exercise.OverheadPress,
                incrementWeight(_weightMap[Exercise.OverheadPress],
                    Exercise.OverheadPress, this),
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
                getVolumeDayWeightFromIntensityDay(
                    _weightMap[Exercise.BenchPress],
                    _haveMicroplates,
                    _weightUnit),
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
        break;
      case WorkoutType.RestDay:
        return DailyRestPrescription();
        break;
      default:
        break;
    }

    return DailyExercisePrescription(prescriptionList);
  }

  static Future<Map<Weekday, IDailyPrescription>> getThisWeeksWorkouts(
      Settings settings) async {
    await DBHelper.updateSettingsFromDB(settings);

    Map<Weekday, IDailyPrescription> dailyPrescriptionMap = new Map();

    Weekday.values.forEach((weekday) {
      if (settings.phases.isThreeDay()) {
        if (settings.threeDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = settings.getDailyPrescriptions(
              settings.getThreeDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      } else {
        if (settings.fourDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = settings.getDailyPrescriptions(
              settings.getFourDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      }
    });

    return dailyPrescriptionMap;
  }
}
