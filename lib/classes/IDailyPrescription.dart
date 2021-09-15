import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

abstract class IDailyPrescription {
  List<ExercisePrescriptionTuple> toTupleList();
}

class ExercisePrescriptionTuple {
  Exercise _exercise;
  SingleExercisePrescription _singleExercisePrescription;

  ExercisePrescriptionTuple(this._exercise, this._singleExercisePrescription);

  Exercise get exercise {
    return _exercise;
  }

  SingleExercisePrescription get singleExercisePrescription {
    return _singleExercisePrescription;
  }

  @override
  String toString() {
    return _exercise == Exercise.Rest
        ? Constants.REST_DAY
        : _singleExercisePrescription.toString();
  }
}
