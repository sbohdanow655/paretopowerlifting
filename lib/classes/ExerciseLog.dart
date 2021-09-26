import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class ExerciseLog extends SingleExercisePrescription {
  bool _didPass;

  ExerciseLog(Exercise exercise, String weight, String weightUnit, int numSets,
      int numReps, bool didPass)
      : super(exercise, weight, weightUnit, numSets, numReps) {
    _didPass = didPass;
  }

  get didPass {
    return _didPass;
  }

  static ExerciseLog fromSingleExercisePrescription(
      SingleExercisePrescription singleExercisePrescription, bool didPass) {
    ExerciseLog singleExercisePrescriptionWithPassFail = ExerciseLog(
        singleExercisePrescription.exercise,
        singleExercisePrescription.weight,
        singleExercisePrescription.weightUnit,
        singleExercisePrescription.numSets,
        singleExercisePrescription.numReps,
        didPass);
    return singleExercisePrescriptionWithPassFail;
  }

  String toExerciseString() {
    return super.toExerciseString();
  }

  String toPrescriptionString() {
    return super.toPrescriptionString();
  }

  get passFailString {
    return _didPass ? Constants.PASS : Constants.FAIL;
  }
}
