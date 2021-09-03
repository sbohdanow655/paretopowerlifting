import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

import 'SingleExercisePrescription.dart';

class DailyRestPrescription extends IDailyPrescription {  
  DailyRestPrescription();

  String toString() {
    return "Rest Day";
  }

  List<ExercisePrescriptionStringTuple> toTupleList() {
    return [new ExercisePrescriptionStringTuple(Exercise.Rest, Constants.restDay)];
  }
}