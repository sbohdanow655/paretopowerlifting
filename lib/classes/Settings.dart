import '../assets/constants.dart';
import '../model.dart';
import 'DailyExercisePresciption.dart';
import 'DailyRestPrescription.dart';
import 'IDailyPrescription.dart';
import 'SingleExercisePrescription.dart';

class Settings {
  
  static Settings _instance;

  int _squatPhase = 1;
  int _benchPressPhase = 1;
  int _deadliftPhase = 1;
  String _weightUnit = Constants.weightUnitLbs;
  bool _useMicroplates = false;

  Map<Exercise, double> _weightMap = {
    Exercise.Squat : 45,
    Exercise.BenchPress : 45,
    Exercise.Deadlift : 45,
    Exercise.OverheadPress : 45,
    Exercise.PendlayRow : 45,
    Exercise.Skullcrushers : 45,
  };

  Map<WorkoutType, Weekday> _fourDaySchedule = {
    WorkoutType.LowerBody1 : Weekday.Monday,
    WorkoutType.UpperBody1 : Weekday.Tuesday,
    WorkoutType.LowerBody2 : Weekday.Thursday,
    WorkoutType.UpperBody2 : Weekday.Friday
  };

  Map<WorkoutType, Weekday> _threeDaySchedule = {
    WorkoutType.FullBody1 : Weekday.Monday,
    WorkoutType.FullBody2 : Weekday.Wednesday,
    WorkoutType.FullBody3 : Weekday.Friday
  };


  Settings();

  static Settings getInstance() {
    if (_instance == null) {
      _instance = Settings();
    }

    return _instance;
  }

  void setNextWeight(Exercise exercise, String nextWeight) {
    _weightMap[exercise] = double.parse(nextWeight);
    saveSettings();
  }

  String getNextWeight(Exercise exercise) {
    return _weightMap[exercise].toString();
  }

  set useMicroplates(val) {
    _useMicroplates = val;
  }

  set weightUnit(val) {
    _weightUnit = val;
  }

  set squatPhase(val) {
    _squatPhase = val;
  }

  set benchPressPhase(val) {
    _benchPressPhase = val;
  }

  set deadliftPhase(val) {
    _deadliftPhase = val;
  }

  get useMicroplates {
    return _useMicroplates;
  }

  get weightUnit {
    return _weightUnit;
  }

  get squatPhase {
    return _squatPhase;
  }

  get benchPressPhase {
    return _benchPressPhase;
  }

  get deadliftPhase {
    return _deadliftPhase;
  }

  double incrementWeight(double weight, Exercise exercise) {
    double weightIncrement;
    bool isUpperBody = exercise == Exercise.BenchPress || exercise == Exercise.OverheadPress || exercise == Exercise.PendlayRow || exercise == Exercise.Skullcrushers;
    bool isBenchPressPhase3 = _benchPressPhase >= 3;
    bool useMicroplates = _useMicroplates && isUpperBody && isBenchPressPhase3;
    if (useMicroplates) {
      if (_weightUnit == Constants.weightUnitLbs) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (_weightUnit == Constants.weightUnitLbs) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }

    return weight + weightIncrement;
  }

  double incrementWeightTwice(double weight, Exercise exercise) {
    return incrementWeight(incrementWeight(weight, exercise), exercise);
  }

  void _resetExercisePhases() {
    _squatPhase = 1;
    _benchPressPhase = 1;
    _deadliftPhase = 1;
  }

  Map<Weekday, IDailyPrescription> finishWorkoutAndIncrementWeight(Map<Weekday, Map<Exercise, bool>> passFailWeekdayMap, bool resetExercisePhases) {
    Set<Exercise> checkedExerciseSet = new Set();
    passFailWeekdayMap.forEach((weekday, passFailMap) {
      passFailMap.forEach((exercise, didPass) {
      if (didPass) {
        _weightMap[exercise] = incrementWeight(_weightMap[exercise], exercise);
      } else if (!checkedExerciseSet.contains(exercise)) {
        switch(exercise) {
          case Exercise.Squat:
            switch(_squatPhase) {
              case 1:
                _squatPhase = 2;
                break;
              case 2:
                _squatPhase = 3;
                break;
              default:
                break;
            }
            break;
          case Exercise.BenchPress:
            switch(_benchPressPhase) {
              case 1:
                _benchPressPhase = 2;
                break;
              case 2:
                _benchPressPhase = 3;
                break;
              case 3:
                _benchPressPhase = 4;
                break;
              default:
                break;
            }
            break;
          case Exercise.Deadlift:
            switch(_deadliftPhase) {
              case 1:
                _deadliftPhase = 2;
                if (_benchPressPhase == 1) {
                  _benchPressPhase = 2;
                }
                break;
              case 2:
                _deadliftPhase = 3;
                if (_benchPressPhase == 1) {
                  _benchPressPhase = 2;
                }
                break;
              default:
                break;
            }
            break;
          default:
            break;
        }
      }
      checkedExerciseSet.add(exercise);
    });
    });
    
    passFailWeekdayMap = {};
    Weekday.values.forEach((weekday) {
    passFailWeekdayMap[weekday] = {};
    Exercise.values.forEach((exercise) {
      passFailWeekdayMap[weekday][exercise] = false;
    });

    if (resetExercisePhases) {
      _resetExercisePhases();
    }
  });

    return getThisWeeksWorkouts();
  }

  double getVolumeDayWeightFromIntensityDay(double intensityDayWeight, bool useMicroplates) {
    double weightIncrement;
    if (useMicroplates) {
      if (_weightUnit == Constants.weightUnitLbs) {
        weightIncrement = 2.5;
      } else {
        weightIncrement = 1;
      }
    } else {
      if (_weightUnit == Constants.weightUnitLbs) {
        weightIncrement = 5;
      } else {
        weightIncrement = 2;
      }
    }
    return (0.8 * intensityDayWeight / weightIncrement).round() * weightIncrement;
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

  WorkoutType getThreeDayWorkoutTypeFromWeekday(Weekday weekday) {
    WorkoutType workoutTypeFromWeekday;
    
    _threeDaySchedule.keys.forEach((workoutType) {
      if (_threeDaySchedule[workoutType] == weekday) {
        workoutTypeFromWeekday = workoutType;
      }
    });

    return workoutTypeFromWeekday;
  }

  void addDayToFourDaySchedule(Weekday weekday, WorkoutType workoutType) {
    _fourDaySchedule[workoutType] = weekday;
    saveSettings();
  }

  void addDayToThreeDaySchedule(Weekday weekday, WorkoutType workoutType) {
    _threeDaySchedule[workoutType] = weekday;
    saveSettings();
  }

  bool is3day() {
    return _squatPhase <= 2 && _deadliftPhase <= 2 && _benchPressPhase <= 2;
  } 

  IDailyPrescription getDailyPrescriptions(WorkoutType workoutType) {
    List<SingleExercisePrescription> prescriptionList = [];
    
    switch(workoutType) {
      case WorkoutType.FullBody1:
        prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, _weightMap[Exercise.BenchPress], _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, _weightMap[Exercise.Deadlift], _weightUnit, 1, 5));

        break;
      case WorkoutType.FullBody2:
        prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, incrementWeight(_weightMap[Exercise.Squat], Exercise.Squat), _weightUnit, 3, 5));

        switch(_benchPressPhase) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, incrementWeight(_weightMap[Exercise.BenchPress], Exercise.BenchPress), _weightUnit, 3, 5));
            break;
          default:
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, _weightMap[Exercise.OverheadPress], _weightUnit, 3, 5));
            break;
        }
          
        switch(_deadliftPhase) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, incrementWeight(_weightMap[Exercise.Deadlift], Exercise.Deadlift), _weightUnit, 1, 5));
            break;
          default:
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, _weightMap[Exercise.PendlayRow], _weightUnit, 3, 8));
            break;
        }
        break;
      case WorkoutType.FullBody3:
        prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, incrementWeightTwice(_weightMap[Exercise.Squat], Exercise.Squat), _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, incrementWeightTwice(_weightMap[Exercise.BenchPress], Exercise.BenchPress), _weightUnit, 3, 5));
        prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, incrementWeightTwice(_weightMap[Exercise.Deadlift], Exercise.Deadlift), _weightUnit, 1, 5));

        break;
      case WorkoutType.LowerBody1:
        switch(_squatPhase) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, _weightMap[Exercise.Squat], _weightUnit, 3, 3));
            break;
        }
        
        switch(_deadliftPhase) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, _weightMap[Exercise.Deadlift], _weightUnit, 1, 5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, getVolumeDayWeightFromIntensityDay(_weightMap[Exercise.Deadlift], false), _weightUnit, 2, 5));
            break;
        }
      
        break;
      case WorkoutType.UpperBody1:
        switch(_benchPressPhase) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, _weightMap[Exercise.Deadlift], _weightUnit, 3, 5));
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, _weightMap[Exercise.Deadlift], _weightUnit, 3, 8));
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, _weightMap[Exercise.Deadlift], _weightUnit, 3, 5));

            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, _weightMap[Exercise.BenchPress], _weightUnit, 5, 3));
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, _weightMap[Exercise.PendlayRow], _weightUnit, 3, 8));
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, _weightMap[Exercise.OverheadPress], _weightUnit, 5, 3));

            break;
          case 4:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, _weightMap[Exercise.BenchPress], _weightUnit, 3, 3));
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, getVolumeDayWeightFromIntensityDay(_weightMap[Exercise.OverheadPress], _useMicroplates), _weightUnit, 5, 5));
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, _weightMap[Exercise.PendlayRow], _weightUnit, 3, 8));

            break;
        }
        break;
      case WorkoutType.LowerBody2:
        switch(_squatPhase) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, incrementWeight(_weightMap[Exercise.Squat], Exercise.Squat), _weightUnit, 3, 5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, incrementWeight(_weightMap[Exercise.Squat], Exercise.Squat), _weightUnit, 3, 5));
            break;
          default:
            break;
        }

        switch(_deadliftPhase) {
          case 1:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, incrementWeight(_weightMap[Exercise.Deadlift], Exercise.Deadlift), _weightUnit, 1, 5));
            break;
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, incrementWeight(_weightMap[Exercise.Deadlift], Exercise.Deadlift), _weightUnit, 1, 5));
            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, _weightMap[Exercise.Deadlift], _weightUnit, 2, 3));
        }
        if (_squatPhase == 3) {
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, getVolumeDayWeightFromIntensityDay(_weightMap[Exercise.Squat], false), _weightUnit, 5, 5));
        }

        break;
      case WorkoutType.UpperBody2:
        switch(_benchPressPhase) {
          case 1:
          case 2:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, incrementWeight(_weightMap[Exercise.BenchPress], Exercise.BenchPress), _weightUnit, 3, 5));
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, incrementWeight(_weightMap[Exercise.PendlayRow], Exercise.PendlayRow), _weightUnit, 3, 8));
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, incrementWeight(_weightMap[Exercise.OverheadPress], Exercise.OverheadPress), _weightUnit, 3, 5));

            break;
          case 3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, incrementWeight(_weightMap[Exercise.BenchPress], Exercise.BenchPress), _weightUnit, 5, 3));
            prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, incrementWeight(_weightMap[Exercise.PendlayRow], Exercise.PendlayRow), _weightUnit, 3, 8));
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, incrementWeight(_weightMap[Exercise.OverheadPress], Exercise.OverheadPress), _weightUnit, 5, 3));

            break;
          case 4:
            prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, _weightMap[Exercise.OverheadPress], _weightUnit, 3, 3));
            prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, getVolumeDayWeightFromIntensityDay(_weightMap[Exercise.BenchPress], _useMicroplates), _weightUnit, 5, 5));
            prescriptionList.add(new SingleExercisePrescription(Exercise.Skullcrushers, _weightMap[Exercise.Skullcrushers], _weightUnit, 3, 8));

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

  Map<Weekday, IDailyPrescription> getThisWeeksWorkouts() {

    Map<Weekday, IDailyPrescription> dailyPrescriptionMap = new Map();

    Weekday.values.forEach((weekday) {
      if (is3day()) {
        if (threeDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = getDailyPrescriptions(getThreeDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      } else {
        if (fourDayScheduleContainsWeekday(weekday)) {
          dailyPrescriptionMap[weekday] = getDailyPrescriptions(getFourDayWorkoutTypeFromWeekday(weekday));
        } else {
          dailyPrescriptionMap[weekday] = new DailyRestPrescription();
        }
      }

    });

    return dailyPrescriptionMap;
  }

  void saveSettings() {
    Model.updateSettings(_useMicroplates, _weightUnit, _squatPhase, _benchPressPhase, _deadliftPhase, _threeDaySchedule[WorkoutType.FullBody1], _threeDaySchedule[WorkoutType.FullBody2], _threeDaySchedule[WorkoutType.FullBody3], _fourDaySchedule[WorkoutType.LowerBody1], _fourDaySchedule[WorkoutType.UpperBody1], _fourDaySchedule[WorkoutType.LowerBody2], _fourDaySchedule[WorkoutType.UpperBody2], _weightMap[Exercise.Squat], _weightMap[Exercise.BenchPress], _weightMap[Exercise.Deadlift], _weightMap[Exercise.OverheadPress], _weightMap[Exercise.PendlayRow], _weightMap[Exercise.Skullcrushers]);
  }

  void updateSettingsFromDB() async {

    Map settingsMap = await Model.getSettings();
    settingsMap.forEach((key, value) { 
      switch(key) {
        case 'useMicroplates':
          _useMicroplates = value == 1;
          break;
        case 'weightUnit':
          _weightUnit = value;
          break;
        case 'squatPhase':
          _squatPhase = value;
          break;
        case'benchPressPhase':
          _benchPressPhase = value;
          break;
        case 'deadliftPhase':
          _deadliftPhase = value;
          break;
        case 'fullbody1':
          _threeDaySchedule[WorkoutType.FullBody1] = Constants.weekdayByString[value];
          break;
        case 'fullbody2':
          _threeDaySchedule[WorkoutType.FullBody2] = Constants.weekdayByString[value];
          break;
        case 'fullbody3':
          _threeDaySchedule[WorkoutType.FullBody3] = Constants.weekdayByString[value];
          break;  
        case 'split1':
          _fourDaySchedule[WorkoutType.LowerBody1] = Constants.weekdayByString[value];
          break;
        case 'split2':
          _fourDaySchedule[WorkoutType.UpperBody1] = Constants.weekdayByString[value];
          break;
        case 'split3':
          _fourDaySchedule[WorkoutType.LowerBody2] = Constants.weekdayByString[value];
          break;
        case 'split4':
          _fourDaySchedule[WorkoutType.LowerBody2] = Constants.weekdayByString[value];
          break;
        case 'squatWeight':
          _weightMap[Exercise.Squat] = value;
          break;
        case 'benchPressWeight':
          _weightMap[Exercise.BenchPress] = value;
          break;
        case 'deadliftWeight':
          _weightMap[Exercise.Deadlift] = value;
          break;
        case 'overheadPressWeight':
          _weightMap[Exercise.OverheadPress] = value;
          break;
        case 'pendlayRowWeight':
          _weightMap[Exercise.PendlayRow] = value;
          break;
        case 'skullcrusherWeight':
          _weightMap[Exercise.Skullcrushers] = value;
          break;
        default:
          break;
      }

    });
  }
}
    
    
