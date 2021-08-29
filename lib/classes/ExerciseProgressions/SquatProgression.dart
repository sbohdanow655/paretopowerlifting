import '../../assets/constants.dart';
import '../ExerciseProgression.dart';
import '../ExercisePrescription.dart';
import 'dart:collection';

class SquatProgression extends ExerciseProgression {

  ExercisePrescription _lastPrescription;

  HashMap<int, double> _weightAddMap;
  HashMap<int, int> _setMap;
  HashMap<int, int> _repMap;


  SquatProgression(this._lastPrescription) {

      if (_lastPrescription.getWeightUnit() == Constants.weightUnitLbs) {
        _weightAddMap[1] = Constants.bigWeightIncrementLbs;
        _weightAddMap[2] = Constants.bigWeightIncrementLbs;
        _weightAddMap[3] = Constants.bigWeightIncrementLbs;
      } else {
        _weightAddMap[1] = Constants.bigWeightIncrementKg;
        _weightAddMap[2] = Constants.bigWeightIncrementKg;
        _weightAddMap[3] = Constants.bigWeightIncrementKg;
      }

      
    }
    
    void pass() {
      this.
    }

    void fail() {

    }
}
