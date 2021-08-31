import './ExercisePrescription.dart';
import './WorkoutSchedule.dart';

abstract class ExerciseProgression {

  ExercisePrescription _prescription;

  ExercisePrescription get prescription {
    return _prescription;
  }

  set prescription(prescription) {
    _prescription = prescription;
  }

  void addWeight();

  void incrementPhase();

  bool is3day();

  void updatePrescription(bool didPass, WorkoutSchedule workoutSchedule) {
    if (didPass) {
      addWeight();
    } else {
      incrementPhase();
    }

    prescription.day = workoutSchedule.getNextWorkoutDay(is3day(), prescription.day);   
  }

}