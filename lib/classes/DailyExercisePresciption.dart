import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class DailyExercisePrescription extends IDailyPrescription {
  List<SingleExercisePrescription> _singleExercisePrescription;

  DailyExercisePrescription(this._singleExercisePrescription);

  List<ExercisePrescriptionTuple> toTupleList() {
    List<ExercisePrescriptionTuple> tupleList = [];

    this._singleExercisePrescription.forEach((singleExercisePrescription) {
      tupleList.add(new ExercisePrescriptionTuple(
          singleExercisePrescription.exercise, singleExercisePrescription));
    });

    return tupleList;
  }
}
