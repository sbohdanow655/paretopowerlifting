import 'assets/constants.dart';
import '../ExcercisePrescription.dart';

class SkullCrusherPrescription extends ExercisePrescription {
  @override
  void pass() {
    if (_weightUnit == Constants.weightUnitLbs) {
      _weight += Constants.bigWeightIncrementLbs;
    } else {
      _weight += Constants.bigWeightIncrementKg;
    }
}

  @override
  void fail() {
    if (_phaseNumber < 3) {
      _phaseNumber++;
    }
  }
}