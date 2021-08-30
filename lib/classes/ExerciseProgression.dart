import './ExercisePrescription.dart';
import './WorkoutSchedule.dart';

abstract class ExerciseProgression {
  
  List<ExerciseProgression> observerList;
  
  ExercisePrescription _lastPrescription;
  WorkoutSchedule _workoutSchedule; 

  ExercisePrescription pass();

  ExercisePrescription fail();

  void update();

  void _notifyAllObservers() {
    observerList.forEach((observer) {
      observer.update();
    });
  }

  get lastPrescription {
    return _lastPrescription;
  }

  get workoutSchedule {
    return _workoutSchedule;
  }

  set lastPrescription(lastPrescription) {
    _lastPrescription = lastPrescription;
    _notifyAllObservers();
  }
  
  set workoutSchedule(workoutSchedule) {
    _workoutSchedule = workoutSchedule;
    _notifyAllObservers();
  }

}