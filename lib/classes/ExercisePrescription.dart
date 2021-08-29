import '../assets/constants.dart';

class ExercisePrescription {
  int _id;
  String _exercise;
  double _weight;
  String _weightUnit;
  int _numSets;
  int _numReps;
  int _phaseNumber;

  ExercisePrescription(this._id, this._exercise, this._weight, this._weightUnit, this._numSets, this._numReps, this._phaseNumber);

  int getId() {
    return _id;
  }

  String toString() {
    return _exercise + " " + _weight.toString() + _weightUnit + " " + _numSets.toString() + "x" + _numReps.toString();
  }
}