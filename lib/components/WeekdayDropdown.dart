import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';

class WeekdayDropdown extends StatefulWidget {
  final WorkoutType _workoutType;
  final Settings _settings;

  WeekdayDropdown(this._workoutType, this._settings);

  @override
  State<StatefulWidget> createState() {
    return WeekdayDropdownState(_workoutType, _settings);
  }
}

class WeekdayDropdownState extends State<WeekdayDropdown> {
  final WorkoutType _workoutType;
  final Settings _settings;

  WeekdayDropdownState(this._workoutType, this._settings) {
    _selectedWeekday = _settings.getWeekdayFromWorkoutType(_workoutType);
  }

  Weekday _selectedWeekday;

  void setSelectedWeekday(Weekday weekday) {
    _settings.addDayToSchedule(weekday, _workoutType);

    switch (_workoutType) {
      case WorkoutType.FullBody1:
        DBHelper.saveSettingToDB(_settings, Constants.DB_FULLBODY_ONE);
        break;
      case WorkoutType.FullBody2:
        DBHelper.saveSettingToDB(_settings, Constants.DB_FULLBODY_TWO);
        break;
      case WorkoutType.FullBody3:
        DBHelper.saveSettingToDB(_settings, Constants.DB_FULLBODY_THREE);
        break;
      case WorkoutType.LowerBody1:
        DBHelper.saveSettingToDB(_settings, Constants.DB_LOWERBODY_ONE);
        break;
      case WorkoutType.UpperBody1:
        DBHelper.saveSettingToDB(_settings, Constants.DB_UPPERBODY_ONE);
        break;
      case WorkoutType.LowerBody2:
        DBHelper.saveSettingToDB(_settings, Constants.DB_LOWERBODY_TWO);
        break;
      case WorkoutType.UpperBody2:
        DBHelper.saveSettingToDB(_settings, Constants.DB_UPPERBODY_TWO);
        break;
      default:
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
        style: TextStyle(
            color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
        onChanged: (val) => setSelectedWeekday(Constants.weekdayByString[val]),
        items: Constants.weekdayByString.keys
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList());
  }
}
