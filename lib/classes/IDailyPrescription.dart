import 'dart:collection';

import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

abstract class IDailyPrescription {
  List<ExercisePrescriptionStringTuple> toTupleList();
}

class ExercisePrescriptionStringTuple {
  Exercise _exercise;
  String _prescriptionString;
  
  ExercisePrescriptionStringTuple(this._exercise, this._prescriptionString);

  Exercise get exercise {
    return _exercise;
  }

  String get prescriptionString {
    return _prescriptionString;
  }

}