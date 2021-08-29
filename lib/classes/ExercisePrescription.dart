abstract class ExercisePrescription {
  int _id;
  String _exercise;
  int _weight;
  String _weightUnit;
  int _numSets;
  int _numReps;

  ExercisePrescription(id, exercise, weight, weightUnit, numSets, numReps) {
    _id = id;
    _exercise = exercise;
    _weight = weight;
    _weightUnit = weightUnit;
    _numSets = _numSets;
    _numReps = numReps;
  }

  int getId() {
    return _id;
  }

  void pass();
  void fail();

  String toString() {
    return _exercise + " " + _weight.toString() + _weightUnit + " " + _numSets + "x" + _numReps;
  }
}