class Model {

  static ExercisePrescription _getExercisePrescription(exerciseName) {

  }

  static bool _getPassOrFail(id) {

  }

  static void saveExercisePrescription(date, exercise, weight, weightUnit, numSets, numReps) {

  }

  static ExercisePrescription getNextExercisePrescription(exerciseName) {
    ExercisePrescription prescription = _getPreviousExerciseSubscription(exerciseName);
    bool didPass = _getPreviousPassOrFail(prevPrescription.getId());
    if (didPass) {
      prescription.pass();
    } else {
      prescription.fail();
    }

    return prescription;
  }


}