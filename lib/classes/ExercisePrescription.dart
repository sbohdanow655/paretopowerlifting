class ExercisePrescription {
  final int _id;
  final String _exerciseName;
  final double _weight;
  final String _weightUnit;
  final int _numSets;
  final int _numReps;
  final int _phaseNumber;

  ExercisePrescription(this._id, this._exerciseName, this._weight, this._weightUnit, this._numSets, this._numReps, this._phaseNumber);

  int get id {
    return _id;
  }

  String get exerciseName {
    return _exerciseName;
  }

  double get weight {
    return _weight;
  }

  String get weightUnit {
    return _weightUnit;
  }

  int get phaseNumber {
    return _phaseNumber;
  }

  String toString() {
    return _exerciseName + " " + _weight.toString() + _weightUnit + " " + _numSets.toString() + "x" + _numReps.toString();
  }
}