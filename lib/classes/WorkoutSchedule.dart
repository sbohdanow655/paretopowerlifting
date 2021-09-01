import '../assets/constants.dart';

enum Weekday {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

class WorkoutSchedule {

  Map<Weekday, int> _valueByWeekday = {
    Weekday.Monday : 0,
    Weekday.Tuesday : 1,
    Weekday.Wednesday : 2,
    Weekday.Thursday : 3,
    Weekday.Friday : 4,
    Weekday.Saturday : 5,
    Weekday.Sunday : 6
  };

  List<Weekday> _weekdayList = [
    Weekday.Monday,
    Weekday.Tuesday,
    Weekday.Wednesday,
    Weekday.Thursday,
    Weekday.Friday,
    Weekday.Saturday,
    Weekday.Sunday
  ];

  final Set<Weekday> _fullBodyDays;
  final Set<Weekday> _splitDays;

  WorkoutSchedule(this._fullBodyDays, this._splitDays);

  List<Weekday> getThisWeeksWorkouts(bool is3day) {
    List<Weekday> workoutDays = [];
    
    if (is3day) {
      workoutDays = _fullBodyDays.toList();
    } else {
      workoutDays = _splitDays.toList();
    }

    workoutDays.sort((a, b) {
      return _valueByWeekday[a] - _valueByWeekday[b];
    });

    return workoutDays;

  }
  
}