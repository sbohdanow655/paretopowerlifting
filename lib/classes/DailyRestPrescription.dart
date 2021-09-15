import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

class DailyRestPrescription extends IDailyPrescription {
  DailyRestPrescription();

  List<ExercisePrescriptionTuple> toTupleList() {
    return [new ExercisePrescriptionTuple(Exercise.Rest, null)];
  }
}
