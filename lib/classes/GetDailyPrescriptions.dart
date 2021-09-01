import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'Settings.dart';
import 'WorkoutSchedule.dart';

class GetDailyPrescriptions {

  static List<SingleExercisePrescription> getDailyPrescriptions(WorkoutType workoutType) {
    List<SingleExercisePrescription> prescriptionList = [];
    
      switch(workoutType) {
        case WorkoutType.FullBody1:
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift,Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 1, 5));

          break;
        case WorkoutType.FullBody2:
          switch(Settings.state.squatPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(null);
              break;
          }
          
          switch(Settings.state.benchPressPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 3, 5));
              break;
          }
            
          switch(Settings.state.deadliftPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 3, 5));
              break;
            default:
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextPendlayRowWeight, Settings.state.weightUnit, 3, 8));
              break;
          }
          break;
        case WorkoutType.FullBody3:
          prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 3, 5));
          prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 1, 5));

          break;
        case WorkoutType.LowerBody1:
          switch(Settings.state.squatPhaseNumber) {
            case 1:
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 3));
              break;
          }
          
          switch(Settings.state.deadliftPhaseNumber) {
            case 1:
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 1, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit,, 2, 5));
              break;
          }
        
          break;
        case WorkoutType.UpperBody1:
          switch(Settings.state.benchPressPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 3, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 3, 5));

              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 5, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextPendlayRowWeight, Settings.state.weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 5, 3));

              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 3, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 5, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextPendlayRowWeight, Settings.state.weightUnit, 3, 8));

              break;
          }
          break;
        case WorkoutType.LowerBody2:
          switch(Settings.state.squatPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 3, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Squat, Settings.state.nextSquatWeight, Settings.state.weightUnit, 5, 5));
          }

          switch(Settings.state.deadliftPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 1, 5));
              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 1, 5));
              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.Deadlift, Settings.state.nextDeadliftWeight, Settings.state.weightUnit, 2, 3));
          }

          break;
        case WorkoutType.UpperBody2:
          switch(Settings.state.benchPressPhaseNumber) {
            case 1:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 3, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextPendlayRowWeight, Settings.state.weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 3, 5));

              break;
            case 2:
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 5, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.PendlayRow, Settings.state.nextPendlayRowWeight, Settings.state.weightUnit, 3, 8));
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 5, 3));

              break;
            case 3:
              prescriptionList.add(new SingleExercisePrescription(Exercise.OverheadPress, Settings.state.nextOverheadPressWeight, Settings.state.weightUnit, 3, 3));
              prescriptionList.add(new SingleExercisePrescription(Exercise.BenchPress, Settings.state.nextBenchPressWeight, Settings.state.weightUnit, 5, 5));
              prescriptionList.add(new SingleExercisePrescription(Exercise.Skullcrushers, Settings.state.nextSkullcrusherWeight, Settings.state.weightUnit, 3, 8));

              break;
          }
      }

      return prescriptionList;
  }
}