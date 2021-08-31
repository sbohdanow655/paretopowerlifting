import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

import '../../assets/constants.dart';
import '../ExerciseProgression.dart';
import '../ExercisePrescription.dart';
import 'dart:collection';

class SquatProgression extends ExerciseProgression {

  int _phaseNumber;

  HashMap<int, double> _weightAddMap = new HashMap<int, double>();
  HashMap<String, int> _setMap = new HashMap<String, int>();
  HashMap<String, int> _repMap = new HashMap<String, int>();
    

  SquatProgression(prescription, workoutSchedule) {
    this.prescription = prescription;
    this.workoutSchedule = workoutSchedule;
  }

  void updateFromWorkSchedule() {
    _setMap = new HashMap<String, int>();
    _repMap = new HashMap<String, int>();
    
    switch (_phaseNumber) {
      case 1:
        _setMap[workoutSchedule.fullBodyDay1] = 3;
        _repMap[workoutSchedule.fullBodyDay1] = 5;
        _setMap[workoutSchedule.fullBodyDay2] = 3;
        _repMap[workoutSchedule.fullBodyDay2] = 5;
        _setMap[workoutSchedule.fullBodyDay3] = 3;
        _repMap[workoutSchedule.fullBodyDay3] = 5;
        break;
      case 2:
        _setMap[workoutSchedule.fullBodyDay1] = 3;
        _repMap[workoutSchedule.fullBodyDay1] = 5;
        _setMap[workoutSchedule.fullBodyDay3] = 3;
        _repMap[workoutSchedule.fullBodyDay3] = 5;
        break;
      case 3:
        _setMap[workoutSchedule.lowerBodyDay1] = 3;
        _repMap[workoutSchedule.lowerBodyDay1] = 3;
        _setMap[workoutSchedule.lowerBodyDay2] = 3;
        _repMap[workoutSchedule.lowerBodyDay2] = 5;
        break;
    }
  }

  void updatePrescription(didPass) {
    HashMap<int, double> _weightAddMap = new HashMap<int, double>();

    if (prescription.weightUnit == Constants.weightUnitLbs) {
      _weightAddMap[1] = Constants.bigWeightIncrementLbs;
      _weightAddMap[2] = Constants.bigWeightIncrementLbs;
      _weightAddMap[3] = Constants.bigWeightIncrementLbs;
    } else {
      _weightAddMap[1] = Constants.bigWeightIncrementKg;
      _weightAddMap[2] = Constants.bigWeightIncrementKg;
      _weightAddMap[3] = Constants.bigWeightIncrementKg;
    }

    

    double weight = prescription.weight;
    int phaseNumber = prescription.phaseNumber;

    if (didPass) {
      weight += _weightAddMap[phaseNumber];
    } else {
      phaseNumber++;
    }

    this.prescription = new ExercisePrescription(prescription.exerciseName, weight, prescription.weightUnit, _numSets, _numReps, _phaseNumber)
   
  }

}
