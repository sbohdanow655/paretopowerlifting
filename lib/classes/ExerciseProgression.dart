import './ExercisePrescription.dart';

abstract class ExerciseProgression {

  ExercisePrescription _prescription;

  ExercisePrescription get prescription {
    return _prescription;
  }

  set prescription(prescription) {
    _prescription = prescription;
  }

  void updateFromWorkSchedule(workoutSchedule);

  void updatePrescription(didPass);

}