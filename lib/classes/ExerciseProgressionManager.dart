import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/ExerciseProgression.dart';

class ExerciseProgressionManager {
  
  static ExerciseProgressionManager exerciseProgressionManager;

  Map<String, ExerciseProgression> _observerMap;

  ExerciseProgressionManager() {
    exerciseProgressionManager = this;    
  }

  void addObserver(exerciseName, exerciseProgression) {
    _observerMap[exerciseName] = exerciseProgression;
  }

  void updateFromWorkoutSchedule(workoutSchedule) {
    _observerMap.forEach((exerciseName, exercisePrescription) {
      exercisePrescription.updatePrescription(didPass, workoutSchedule)
    });
  }

}