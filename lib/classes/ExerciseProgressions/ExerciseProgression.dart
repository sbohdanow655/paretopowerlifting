import '../SingleExercisePrescription.dart';

abstract class ExerciseProgression {

  double getWeightIncrement(SingleExercisePrescription exercisePrescription);

  int getNextPhase(SingleExercisePrescription exercisePrescription);

  SingleExercisePrescription getPrescriptionFromWorkoutResult(SingleExercisePrescription exercisePrescription, bool wasSuccessful) {
    double weight = exercisePrescription.weight;
    int phaseNumber = exercisePrescription.phaseNumber;

    if (wasSuccessful) {
      weight += getWeightIncrement(exercisePrescription);
    } else {
      phaseNumber = getNextPhase(exercisePrescription);
    }

    return new SingleExercisePrescription(exercisePrescription.exerciseName, weight, exercisePrescription.weightUnit, phaseNumber, exercisePrescription.numSets, exercisePrescription.numReps);
  }
}