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

  Weekday getNextWorkoutDay(bool is3day, Weekday lastWorkoutDay) {
    int lastValue = _valueByWeekday[lastWorkoutDay];

    for (int i = lastValue + 1; i <= _weekdayList.length; i++) {
      if (i == _weekdayList.length) {
        i = 0;
      }

      if (is3day) {
        
        if (_fullBodyDays.contains(_weekdayList[i])) {
          return _weekdayList[i];
        }

      } else {
        
        if (_splitDays.contains(_weekdayList[i])) {
          return _weekdayList[i];
        }
      }
      
      throw Exception("Weekday not found");
    }
  }
  
}