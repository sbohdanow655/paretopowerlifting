import 'package:flutter/material.dart';
import './view.dart';
import './model.dart';
import './assets/constants.dart';

class Presenter {

  static View view;

  static View run() {    
    view = View();
    return view;
  }

  static void saveExercisePrescription(date, exercise, weight, weightUnit, numSets, numReps) {
    Model.saveExercisePrescription(date, exercise, weight, weightUnit, numSets, numReps);
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

