class SingleExercisePrescription {
  final String _exerciseName;
  double _weight;
  String _weightUnit;
  int _numSets;
  int _numReps;

  SingleExercisePrescription(this._exerciseName, this._weight, this._weightUnit, this._numSets, this._numReps);

  String get exerciseName {
    return _exerciseName;
  }

  double get weight {
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
    return _exerciseName + " " + _weight.toString() + _weightUnit + " " + _numSets.toString() + "x" + _numReps.toString();
  }
}