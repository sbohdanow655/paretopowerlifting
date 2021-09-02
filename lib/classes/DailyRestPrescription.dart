import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

import 'SingleExercisePrescription.dart';

class DailyRestPrescription extends IDailyPrescription {
  DailyRestPrescription();

  List<ExercisePrescriptionStringTuple> toTupleList() {
    return [new ExercisePrescriptionStringTuple(Constants.exerciseStrings[Exercise.Rest], Constants.restDay)];
  }

}