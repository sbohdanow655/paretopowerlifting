import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

class DailyRestPrescription extends IDailyPrescription {
  DailyRestPrescription();

  List<ExercisePrescriptionStringTuple> toTupleList() {
    return [new ExercisePrescriptionStringTuple(Exercise.Rest, Constants.REST_DAY)];
  }

}