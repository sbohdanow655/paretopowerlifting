import 'assets/constants.dart';
import '../ExcercisePrescription.dart';

class BenchPressPrescription extends ExercisePrescription {
  @override
  void pass() {
    if (_weightUnit == Constants.weightUnitLbs) {
      if (_phaseNumber < 3) {
        _weight += Constants.bigWeightIncrementLbs;
      } else {
        _weight += Constants.smallWeightIncrementLbs;
      }
    } else {
      if (_phaseNumber < 3) {
        _weight += Constants.bigWeightIncrementKg;
      } else {
        _weight += Constants.smallWeightIncrementKg;
      }
    }
}

  @override
  void fail() {
    if (_phaseNumber < 4) {
      _phaseNumber++;
    }
  }
}