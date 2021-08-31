import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

import './ExercisePrescription.dart';

abstract class ExerciseProgression {

  WorkoutSchedule _workoutSchedule;
  ExercisePrescription _prescription;

  WorkoutSchedule get workoutSchedule {
    return _workoutSchedule;
  }

  ExercisePrescription get prescription {
    return _prescription;
  }

  set workoutSchedule(workoutSchedule) {
    _workoutSchedule = workoutSchedule;
  }

  set prescription(prescription) {
    _prescription = prescription;
  }

  void updateFromWorkSchedule();

  void updatePrescription(didPass);

}