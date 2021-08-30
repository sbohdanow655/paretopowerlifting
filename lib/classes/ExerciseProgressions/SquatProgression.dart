import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

import '../../assets/constants.dart';
import '../ExerciseProgression.dart';
import '../ExercisePrescription.dart';
import 'dart:collection';

class SquatProgression extends ExerciseProgression {

  double _weight;
  int _phaseNumber;
  int _numSets;
  int _numReps;

  HashMap<int, double> _weightAddMap = new HashMap<int, double>();
  HashMap<String, int> _setMap = new HashMap<String, int>();
  HashMap<String, int> _repMap = new HashMap<String, int>();
    

  SquatProgression(lastPrescription, workoutSchedule) {

    if (lastPrescription.weightUnit == Constants.weightUnitLbs) {
      _weightAddMap[1] = Constants.bigWeightIncrementLbs;
      _weightAddMap[2] = Constants.bigWeightIncrementLbs;
      _weightAddMap[3] = Constants.bigWeightIncrementLbs;
    } else {
      _weightAddMap[1] = Constants.bigWeightIncrementKg;
      _weightAddMap[2] = Constants.bigWeightIncrementKg;
      _weightAddMap[3] = Constants.bigWeightIncrementKg;
    }

    update();     
  }

  void update() {
    _setMap[workoutSchedule.fullBody_day1] = 3;
    _repMap[workoutSchedule.fullBody_day1] = 5;
    _setMap[workoutSchedule.fullBody_day2] = 3;
    _repMap[workoutSchedule.fullBody_day2] = 5;
    _setMap[workoutSchedule.fullBody_day3] = 3;
    _repMap[workoutSchedule.fullBody_day3] = 5;

    _setMap[workoutSchedule.lowerBody_day1] = 3;
    _repMap[workoutSchedule.lowerBody_day1] = 3;
    _setMap[workoutSchedule.lowerBody_day2] = 5;
    _repMap[workoutSchedule.lowerBody_day2] = 5;

    _weight = lastPrescription.weight;
    _phaseNumber = lastPrescription.phaseNumber; 
  }
    
  ExercisePrescription pass() {
    _weight += _weightAddMap[_phaseNumber];
    return ExercisePrescription(lastPrescription.id, lastPrescription.exerciseName, _weight, lastPrescription.weightUnit ,_numSets, _numReps, _phaseNumber);
  }

  ExercisePrescription fail() {
    _phaseNumber++;
  }
}
