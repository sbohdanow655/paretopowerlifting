import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'WorkoutSchedule.dart';

import 'dart:collection';

class GetDailyPrescriptions {

  static List<SingleExercisePrescription> getDailyPrescriptions(WorkoutType workoutType, HashMap<Exercise, int> phaseNumberMap, HashMap<Exercise, double> startingWeightMap, String weightUnit) {
    List<SingleExercisePrescription> prescriptionList = [];
    
      switch(workoutType) {
        case WorkoutType.FullBody1:
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Deadlift], weightUnit, 1, 5));

          break;
        case WorkoutType.FullBody2:
          switch(phaseNumberMap[Exercise.Squat]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(null);
              break;
          }
          
          switch(phaseNumberMap[Exercise.BenchPress]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 3, 5));
              break;
          }
            
          switch(phaseNumberMap[Exercise.Deadlift]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, startingWeightMap[Exercise.Deadlift], weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));
              break;
          }
          break;
        case WorkoutType.FullBody3:
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Deadlift], weightUnit, 1, 5));

          break;
        case WorkoutType.LowerBody1:
          switch(phaseNumberMap[Exercise.Squat]) {
            case 1:
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 3));
              break;
          }
          
          switch(phaseNumberMap[Exercise.Deadlift]) {
            case 1:
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, startingWeightMap[Exercise.Deadlift], weightUnit, 1, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, startingWeightMap[Exercise.Deadlift], weightUnit, 2, 5));
              break;
          }
        
          break;
        case WorkoutType.UpperBody1:
          switch(phaseNumberMap[Exercise.BenchPress]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 3, 5));

              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 5, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 5, 3));

              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 5, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));

              break;
          }
          break;
        case WorkoutType.LowerBody2:
          switch(phaseNumberMap[Exercise.Squat]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 3, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, startingWeightMap[Exercise.Squat], weightUnit, 5, 5));
          }
          break;
        case WorkoutType.UpperBody2:
          switch(phaseNumberMap[Exercise.BenchPress]) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 3, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 3, 5));

              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 5, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, startingWeightMap[Exercise.PendlayRow], weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 5, 3));

              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, startingWeightMap[Exercise.OverheadPress], weightUnit, 3, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, startingWeightMap[Exercise.BenchPress], weightUnit, 5, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.Skullcrushers, startingWeightMap[Exercise.Skullcrushers], weightUnit, 3, 8));

              break;
          }
      }
  }
}