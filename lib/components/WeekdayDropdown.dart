import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';

class WeekdayDropdown extends StatefulWidget {
  
  final WorkoutType _workoutType;

  WeekdayDropdown(this._workoutType);

  @override
  State<StatefulWidget> createState() {
    return WeekdayDropdownState(_workoutType);
  }
}

class WeekdayDropdownState extends State<WeekdayDropdown> {
  
  final WorkoutType _workoutType;

  WeekdayDropdownState(this._workoutType) {
    _selectedWeekday = Settings.getInstance().getWeekdayFromWorkoutType(_workoutType);
  }

  Weekday _selectedWeekday; 

  void setSelectedWeekday(Weekday weekday) {
    
    switch(_workoutType) {
      case WorkoutType.FullBody1:
      case WorkoutType.FullBody2:
      case WorkoutType.FullBody3:

        Settings.getInstance().addDayToThreeDaySchedule(weekday, _workoutType);

        break;
      default:

        Settings.getInstance().addDayToFourDaySchedule(weekday, _workoutType);

       break;
    }
    
    setState(() {
      _selectedWeekday = weekday;
    });

  }

  @override
  Widget build(BuildContext context) {
    
    return DropdownButton<String>(
      value: Constants.weekdayStrings[_selectedWeekday],
      style: TextStyle(color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
      onChanged: (val) => setSelectedWeekday(Constants.weekdayByString[val]),
      items: Constants.weekdayByString.keys
        .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value)
          );
        }).toList()
    );
  }
}