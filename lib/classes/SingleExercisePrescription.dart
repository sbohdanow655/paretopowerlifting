enum Exercise {
  Squat,
  BenchPress,
  Deadlift,
  OverheadPress,
  PendlayRow,
  Skullcrushers
}

class SingleExercisePrescription {
  final Exercise _exercise;
  double _weight;
  String _weightUnit;
  int _phaseNumber;
  int _numSets;
  int _numReps;

  SingleExercisePrescription(this._exercise, this._weight, this._weightUnit, this._phaseNumber, this._numSets, this._numReps);

  Exercise get exercise {
    return _exercise;
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

  int get phaseNumber {
    return _phaseNumber;
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
    return _exercise.toString() + " " + _weight.toString() + _weightUnit + " " + _numSets.toString() + "x" + _numReps.toString();
  }
}