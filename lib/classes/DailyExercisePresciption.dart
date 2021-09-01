import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class DailyExercisePrescription extends IDailyPrescription {
  List<SingleExercisePrescription> _prescriptionList;
  
  DailyExercisePrescription(this._prescriptionList);

  List<ExercisePrescriptionStringTuple> toTupleList() {
    List<ExercisePrescriptionStringTuple> tupleList = [];

    this._prescriptionList.map((singleExercisePrescription) {
      tupleList.add(new ExercisePrescriptionStringTuple(singleExercisePrescription.exercise, singleExercisePrescription.toString()));
    });

    return tupleList;
  } 
}