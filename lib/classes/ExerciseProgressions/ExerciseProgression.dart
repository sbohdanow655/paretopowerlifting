import '../ExercisePrescriptions/SingleExercisePrescription.dart';

abstract class ExerciseProgression {

  int _phaseNumber;
  SingleExercisePrescription _prescription;

  SingleExercisePrescription get prescription {
    return _prescription;
  }

  set prescription(prescription) {
    _prescription = prescription;
  }

  get phaseNumber {
    return _phaseNumber;
  }

  set phaseNumber(phaseNumber) {
    _phaseNumber = phaseNumber;
  }

  void addWeight();

  void incrementPhase();

  bool is3day();

  void updatePrescriptionFromWorkoutResult(bool wasSuccessful) {
    if (wasSuccessful) {
      addWeight();
    } else {
      incrementPhase();
    }
  }
}