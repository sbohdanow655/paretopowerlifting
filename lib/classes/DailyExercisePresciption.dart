import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class DailyExercisePrescription extends IDailyPrescription {
  List<SingleExercisePrescription> _singleExercisePrescriptions;

  DailyExercisePrescription(this._singleExercisePrescriptions);

  List<ExercisePrescriptionTuple> toTupleList() {
    List<ExercisePrescriptionTuple> tupleList = [];

    this._singleExercisePrescriptions.forEach((singleExercisePrescription) {
      tupleList.add(new ExercisePrescriptionTuple(
          singleExercisePrescription.exercise, singleExercisePrescription));
    });

    return tupleList;
  }
}
