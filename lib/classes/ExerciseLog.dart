import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'package:intl/intl.dart';

class ExerciseLog extends SingleExercisePrescription {
  static final _dateFormatter = DateFormat('MMMM d, y');
  bool _didPass;
  String _savedDateString;

  ExerciseLog(Exercise exercise, String weight, String weightUnit, int numSets,
      int numReps, bool didPass, String savedDateString)
      : super(exercise, weight, weightUnit, numSets, numReps) {
    _didPass = didPass;
    _savedDateString = savedDateString;
  }

  get didPass {
    return _didPass;
  }

  static ExerciseLog fromSingleExercisePrescription(
      SingleExercisePrescription singleExercisePrescription,
      bool didPass,
      DateTime savedDateTime) {
    ExerciseLog singleExercisePrescriptionWithPassFail = ExerciseLog(
        singleExercisePrescription.exercise,
        singleExercisePrescription.weight,
        singleExercisePrescription.weightUnit,
        singleExercisePrescription.numSets,
        singleExercisePrescription.numReps,
        didPass,
        _dateFormatter.format(savedDateTime));
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

  get savedDateString {
    return _savedDateString;
  }
}
