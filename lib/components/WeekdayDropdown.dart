import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';

class WeekdayDropdown extends StatefulWidget {
  final WorkoutType _workoutType;
  final WeeklyExercisePrescription _weeklyExercisePrescription;

  WeekdayDropdown(this._workoutType, this._weeklyExercisePrescription);

  @override
  State<StatefulWidget> createState() {
    return WeekdayDropdownState(
        this._workoutType, this._weeklyExercisePrescription);
  }
}

class WeekdayDropdownState extends State<WeekdayDropdown> {
  final WorkoutType _workoutType;
  final WeeklyExercisePrescription _weeklyExercisePrescription;

  WeekdayDropdownState(this._workoutType, this._weeklyExercisePrescription) {
    _selectedWeekday =
        _weeklyExercisePrescription.getWeekdayFromWorkoutType(_workoutType);
  }

  Weekday _selectedWeekday;

  void setSelectedWeekday(Weekday weekday) {
    _weeklyExercisePrescription.setWorkoutDay(_workoutType, weekday);

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
