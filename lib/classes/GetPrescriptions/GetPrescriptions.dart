import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import '../../assets/constants.dart';
import '../WorkoutSchedule.dart';

import 'dart:collection';

class GetDailyPrescriptions {

  static List<SingleExercisePrescription> getDailyPrescriptions(WorkoutType workoutType, int exerciseSlot, int phaseNumber, HashMap<Exercise, double> startingWeightMap, String weightUnit) {
    List<SingleExercisePrescription> prescriptionList = [];
    
    switch(exerciseSlot) {
      case 0:

        switch(workoutType) {
          case WorkoutType.FullBody1:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 5));

            break;
          case WorkoutType.FullBody2:
            switch(phaseNumber) {
              case 1:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 5));
                break;
              default:
                break;
            }
            break;
          case WorkoutType.FullBody3:
            prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 5));
          
            break;
          case WorkoutType.LowerBody1:
            switch(phaseNumber) {
              case 2:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 5));
                break;
              case 3:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 3));
            }
            
          
            break;
          case WorkoutType.UpperBody1:
            switch(phaseNumber) {
              case 1:

                break;
              case 2:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.BenchPress], weightUnit, phaseNumber, 3, 5));
                break;
              case 3:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 3));
            }
            break;
          case WorkoutType.LowerBody2:
            switch(phaseNumber) {
              case 2:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 3, 5));
                break;
              case 3:
                prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, phaseNumber, 5, 5));
            }
            break;
          case WorkoutType.UpperBody2:
            
            break;
        }


        break; 
    }

      }
}