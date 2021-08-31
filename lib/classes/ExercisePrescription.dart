import './WorkoutSchedule.dart';

class ExercisePrescription {
  final String _exerciseName;
  double _weight;
  String _weightUnit;
  int _numSets;
  int _numReps;
  int _phaseNumber;
  Weekday _day; 

  ExercisePrescription(this._day, this._exerciseName, this._weight, this._weightUnit, this._numSets, this._numReps, this._phaseNumber);

  Weekday get day {
    return _day;
  }

  set day(day) {
    _day = day;
  }

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

  int get phaseNumber {
    return _phaseNumber;
  }

  set phaseNumber(phaseNumber) {
    _phaseNumber = phaseNumber;
  }

  String toString() {
    return _exerciseName + " " + _weight.toString() + _weightUnit + " " + _numSets.toString() + "x" + _numReps.toString();
  }
}