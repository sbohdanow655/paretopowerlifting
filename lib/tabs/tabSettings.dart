import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/components/WeekdayDropdown.dart';
import '../assets/constants.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsTabState();
  }
}

class _SettingsTabState extends State<SettingsTab> {
  
  bool _useMicroplates = false;

  String _weightUnit = Constants.weightUnitLbs;

  int _squatPhase;
  int _benchPressPhase;
  int _deadliftPhase;

  _SettingsTabState() {
    _useMicroplates = Settings.getInstance().useMicroplates;
    _weightUnit = Settings.getInstance().weightUnit;
    _squatPhase = Settings.getInstance().squatPhase;
    _benchPressPhase = Settings.getInstance().benchPressPhase;
    _deadliftPhase = Settings.getInstance().deadliftPhase;
  }

  void setMicroplates(val) {
    setState(() {
      _useMicroplates = val;
    });

    Settings.getInstance().useMicroplates = val;
  }

  void setWeightUnit(val) {
    setState(() {
      _weightUnit = val;
    });

    Settings.getInstance().weightUnit = val;

  }

  void setSquatPhase(val) {
    setState(() {
      _squatPhase = val;
    });

    Settings.getInstance().squatPhase = val;
  }

  void setBenchPressPhase(val) {
    setState(() {
      _benchPressPhase = val;
    });
    
    Settings.getInstance().benchPressPhase = val;

  }

  void setDeadliftPhase(val) {
    setState(() {
      _deadliftPhase = val;
    });

    Settings.getInstance().deadliftPhase = val;

  }

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children:[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.useMicroplates, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectWeightUnit, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectSquatPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectBenchPressPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectDeadliftPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectFullBodyWorkoutDay1, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectFullBodyWorkoutDay2, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectFullBodyWorkoutDay3, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectUpperLowerWorkoutDay1, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectUpperLowerWorkoutDay2, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectUpperLowerWorkoutDay3, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: Text(Constants.selectUpperLowerWorkoutDay4, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((val) => Colors.blue),
                  value: _useMicroplates,
                  onChanged: (bool value) {
                    setState(() {
                      _useMicroplates = value;
                    });
                  },
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                DropdownButton<String>(
                  value: _weightUnit,
                  style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
                  onChanged: (val) => setWeightUnit(val),
                  items: <String>[Constants.weightUnitLbs, Constants.weightUnitKg]
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      );
                    }).toList()
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                DropdownButton<int>(
                  value: _squatPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
                  onChanged: (val) => setSquatPhase(val),
                  items: <int>[1, 2, 3]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ 
                DropdownButton<int>(
                  value: _benchPressPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
                  onChanged: (val) => setBenchPressPhase(val),
                  items: <int>[1, 2, 3, 4]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton<int>(
                  value: _deadliftPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
                  onChanged: (val) => setDeadliftPhase(val),
                  items: <int>[1, 2, 3]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.FullBody1)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.FullBody2)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.FullBody3)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.LowerBody1)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.UpperBody1)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.LowerBody2)
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WeekdayDropdown(WorkoutType.UpperBody2)
                ]
            ),
          ]
        )
      ]
      )
    );
  }
}