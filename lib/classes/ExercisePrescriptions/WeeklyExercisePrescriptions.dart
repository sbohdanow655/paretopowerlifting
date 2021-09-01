import 'package:pareto_powerlifting/classes/DailyExercisePrescriptions.dart';
import './WorkoutSchedule.dart';
import 'dart:collection';

class WeeklyExercisePrescription {
  HashMap<Weekday, DailyExercisePrescriptions> _prescriptionsByDay;

  WeeklyExercisePrescription(this._prescriptionsByDay);
    
}