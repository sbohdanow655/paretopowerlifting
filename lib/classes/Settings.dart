import 'dart:collection';

import '../assets/constants.dart';
import 'WorkoutSchedule.dart';

class Settings {
  
  static Settings state;

  int _squatPhaseNumber = 1;
  int _benchPressPhaseNumber = 1;
  int _deadliftPhaseNumber = 1;
  String _weightUnit = Constants.weightUnitLbs;
  bool _useMicroplates = false;
  double _nextSquatWeight = 45;
  double _nextBenchPressWeight = 45;
  double _nextDeadliftWeight = 45;
  double _nextOverheadPressWeight = 45;
  double _nextPendlayRowWeight = 45;
  double _nextSkullcrusherWeight = 45;

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


  Settings() {
    state = this;
  }

  set squatPhaseNumber(phaseNumber) {
    _squatPhaseNumber = phaseNumber;
  }

  set benchPressPhaseNumber(phaseNumber) {
    _benchPressPhaseNumber = phaseNumber;
  }

  set deadliftPhaseNumber(phaseNumber) {
    _deadliftPhaseNumber = phaseNumber;
  }
  
  set weightUnit(weightUnit) {
    _weightUnit = weightUnit;
  }

  set useMicroplates(useMicroplates) {
    _useMicroplates = useMicroplates;
  }

  set nextSquatWeight(nextSquatWeight) {
    _nextSquatWeight = nextSquatWeight;
  }

  set nextBenchPressWeight(nextBenchPressWeight) {
    _nextBenchPressWeight = nextBenchPressWeight;
  }

  set nextDeadliftWeight(nextDeadliftWeight) {
    _nextDeadliftWeight = nextDeadliftWeight;
  }

  set nextOverheadPressWeight(nextOverheadPressWeight) {
    _nextOverheadPressWeight = nextOverheadPressWeight;
  }

  set nextPendlayRowWeight(nextPendlayRowWeight) {
    _nextPendlayRowWeight = nextPendlayRowWeight;
  }

  set nextSkullcrusherWeight(nextSkullcrusherWeight) {
    _nextSkullcrusherWeight = nextSkullcrusherWeight;
  }

  set threeDaySchedule(threeDaySchedule) {
    _threeDaySchedule = threeDaySchedule;
  }

  set fourDaySchedule(fourDaySchedule) {
    _fourDaySchedule = fourDaySchedule;
  }

  int get squatPhaseNumber {
    return _squatPhaseNumber;
  }

  int get benchPressPhaseNumber {
    return _benchPressPhaseNumber;
  }

  int get deadliftPhaseNumber {
    return _deadliftPhaseNumber;
  }
  
  String get weightUnit {
    return _weightUnit;
  }

  bool get useMicroplates {
    return _useMicroplates;
  }

  double get nextSquatWeight {
    return _nextSquatWeight;
  }
  
  double get nextBenchPressWeight {
    return _nextBenchPressWeight;
  }
  
  double get nextDeadliftWeight {
    return _nextDeadliftWeight;
  }

  double get nextOverheadPressWeight {
    return _nextOverheadPressWeight;
  }

  double get nextPendlayRowWeight {
    return _nextPendlayRowWeight;
  }

  double get nextSkullcrusherWeight {
    return _nextSkullcrusherWeight;
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
  }

  void addDayToThreeDaySchedule(Weekday weekday, WorkoutType workoutType) {
    _threeDaySchedule[workoutType] = weekday;
  }

  bool is3day() {
    return Settings.state.squatPhaseNumber <= 2 || Settings.state.deadliftPhaseNumber <= 2 || Settings.state.benchPressPhaseNumber <= 2;
  } 
}