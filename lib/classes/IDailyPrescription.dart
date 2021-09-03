import 'package:pareto_powerlifting/assets/constants.dart';

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