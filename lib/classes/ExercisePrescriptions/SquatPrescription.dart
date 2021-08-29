import '../../assets/constants.dart';
import '../ExercisePrescription.dart';
import 'dart:collection';

class SquatPrescription extends ExercisePrescription {

  HashMap<int, double> weightAddMap;
  HashMap<int, int> setMap;
  HashMap<int, int> repMap;


  SquatPrescription(id, exercise, weight, weightUnit, numSets, numReps, phaseNumber) :
    super(id, exercise, weight, weightUnit, numSets, numReps, phaseNumber) {
      if (weightUnit == Constants.weightUnitLbs) {
        weightAddMap[1] = Constants.bigWeightIncrementLbs;
        weightAddMap[2] = Constants.bigWeightIncrementLbs;
        weightAddMap[3] = Constants.bigWeightIncrementLbs;
      } else {
        weightAddMap[1] = Constants.bigWeightIncrementKg;
        weightAddMap[2] = Constants.bigWeightIncrementKg;
        weightAddMap[3] = Constants.bigWeightIncrementKg;
      }

      s
    }
    
}
