import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

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

  WeekdayDropdownState(this._workoutType);

  Weekday _selectedWeekday;

  void setSelectedWeekday(Weekday weekday) {
    setState(() {
      _selectedWeekday = weekday;
    });

    switch(_workoutType) {
      case WorkoutType.FullBody1:
      case WorkoutType.FullBody2:
      case WorkoutType.FullBody3:
        Settings.state.threeDaySchedule[weekday] = _workoutType;
        break;
      default:
        Settings.state.fourDaySchedule[weekday] = _workoutType;
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    
    return DropdownButton<String>(
      value: Constants.weekdayStrings[_selectedWeekday],
      style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
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