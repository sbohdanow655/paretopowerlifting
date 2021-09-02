import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';
import 'package:pareto_powerlifting/components/WeekdayDropdown.dart';
import '../assets/constants.dart';

class SettingsTab extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsTabState();
  }
}

class _SettingsTabState extends State<SettingsTab> {
  
  bool useMicroplates = false;

  String weightUnit = Constants.weightUnitLbs;

  int squatPhase = 1;
  int benchPressPhase = 1;
  int deadliftPhase = 1;

  Weekday _selectedThreeDay1;
  Weekday _selectedThreeDay2;
  Weekday _selectedThreeDay3;

  Weekday _selectedFourDay1;
  Weekday _selectedFourDay2;
  Weekday _selectedFourDay3;
  Weekday _selectedFourDay4;

  void setSelectedThreeDay1(Weekday weekday) {
    setState(() {
      _selectedThreeDay1 = weekday;
    });

    Settings.state.threeDaySchedule[weekday] = WorkoutType.FullBody1;
  }

  void setSelectedThreeDay2(Weekday weekday) {
    setState(() {
      _selectedThreeDay2 = weekday;
    });

    Settings.state.threeDaySchedule[weekday] = WorkoutType.FullBody2;
  }

  void setSelectedThreeDay3(Weekday weekday) {
    setState(() {
      _selectedThreeDay3 = weekday;
    });

    Settings.state.threeDaySchedule[weekday] = WorkoutType.FullBody3;
  }

  void setSelectedFourDay1(Weekday weekday) {
    setState(() {
      _selectedFourDay1 = weekday;
    });

    Settings.state.fourDaySchedule[weekday] = WorkoutType.LowerBody1;
  }
  
  void setSelectedFourDay2(Weekday weekday) {
    setState(() {
      _selectedFourDay2 = weekday;
    });

    Settings.state.fourDaySchedule[weekday] = WorkoutType.UpperBody1;
  }

  void setSelectedFourDay3(Weekday weekday) {
    setState(() {
      _selectedFourDay3 = weekday;
    });

    Settings.state.fourDaySchedule[weekday] = WorkoutType.LowerBody2;
  }

  void setSelectedFourDay4(Weekday weekday) {
    setState(() {
      _selectedFourDay4 = weekday;
    });

    Settings.state.fourDaySchedule[weekday] = WorkoutType.UpperBody2;
  }

  void setMicroplates(val) {
    setState(() {
      useMicroplates = val;
    });

    Settings.state.useMicroplates = val;
  }

  void setWeightUnit(val) {
    setState(() {
      weightUnit = val;
    });

    Settings.state.weightUnit = val;

  }

  void setSquatPhase(val) {
    setState(() {
      squatPhase = val;
    });

    Settings.state.squatPhaseNumber = val;
  }

  void setBenchPressPhase(val) {
    setState(() {
      benchPressPhase = val;
    });
    
    Settings.state.benchPressPhaseNumber = val;

  }

  void setDeadliftPhase(val) {
    setState(() {
      deadliftPhase = val;
    });

    Settings.state.deadliftPhaseNumber = val;

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
                  value: useMicroplates,
                  onChanged: (bool value) {
                    setState(() {
                      useMicroplates = value;
                    });
                  },
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [  
                DropdownButton<String>(
                  value: weightUnit,
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
                  value: squatPhase,
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
                  value: benchPressPhase,
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
                  value: deadliftPhase,
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