import '../../assets/constants.dart';
import '../ExerciseProgression.dart';
import '../ExercisePrescription.dart';
import 'dart:collection';

class SquatProgression extends ExerciseProgression {

  int _phaseNumber;

  HashMap<String, int> _setMap = new HashMap<String, int>();
  HashMap<String, int> _repMap = new HashMap<String, int>();
    

  SquatProgression(prescription) {
    this.prescription = prescription;
  }

  void updateFromWorkSchedule(workoutSchedule) {
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
    double weightToAdd;

    if (prescription.weightUnit == Constants.weightUnitLbs) {
      weightToAdd = Constants.bigWeightIncrementLbs;
    } else {
      weightToAdd = Constants.bigWeightIncrementKg;
    }
    

    double weight = prescription.weight;
    int phaseNumber = prescription.phaseNumber;

    if (didPass) {
      weight += weightToAdd;
    } else {
      phaseNumber++;
    }

    this.prescription = new ExercisePrescription(prescription.exerciseName, weight, prescription.weightUnit, _numSets, _numReps, phaseNumber);
   
  }

}
