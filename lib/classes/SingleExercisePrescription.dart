import 'package:pareto_powerlifting/assets/constants.dart';

class SingleExercisePrescription {
  final Exercise _exercise;
  String _weight;
  String _weightUnit;
  int _numSets;
  int _numReps;

  SingleExercisePrescription(this._exercise, this._weight, this._weightUnit,
      this._numSets, this._numReps);

  Exercise get exercise {
    return _exercise;
  }

  String get weight {
    return _weight;
  }

  set weight(weight) {
    _weight = weight;
  }

  String get weightUnit {
    return _weightUnit;
  }

  int get numSets {
    return _numSets;
  }

  set numSets(numSets) {
    _numSets = numSets;
  }

  int get numReps {
    return _numReps;
  }

  set numReps(numReps) {
    _numReps = numReps;
  }

  String toString() {
    return Constants.exerciseStrings[exercise] +
        " " +
        weight +
        _weightUnit +
        " " +
        _numSets.toString() +
        "x" +
        _numReps.toString();
  }
}
