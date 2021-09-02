abstract class IDailyPrescription {
  List<ExercisePrescriptionStringTuple> toTupleList();
}

class ExercisePrescriptionStringTuple {
  String _exercise;
  String _prescriptionString;
  
  ExercisePrescriptionStringTuple(this._exercise, this._prescriptionString);

  String get exercise {
    return _exercise;
  }

  String get prescriptionString {
    return _prescriptionString;
  }

}