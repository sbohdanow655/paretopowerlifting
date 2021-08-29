import '../assets/constants.dart';

class ExercisePrescription {
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
    _setNumber = setNumber;
    _numReps = numReps;
  }

  int getId() {
    return _id;
  }

  abstract void pass();
  abstract void fail();

  String toString() {
    return _exercise + " " + _weight + _weightUnit + " " + _numSets + "x" + _numReps;
  }
}