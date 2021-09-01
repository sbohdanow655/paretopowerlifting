import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/SettingsState.dart';
import '../assets/constants.dart';

class Settings extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  
  bool useMicroplates = false;

  String weightUnit = Constants.weightUnitLbs;

  int squatPhase = 1;
  int benchPressPhase = 1;
  int deadliftPhase = 1;

  void setMicroplates(val) {
    setState(() {
      useMicroplates = val;
    });

    SettingsState.settingsState.useMicroplates = val;
  }

  void setWeightUnit(val) {
    setState(() {
      weightUnit = val;
    });

    SettingsState.settingsState.weightUnit = val;

  }

  void setSquatPhase(val) {
    setState(() {
      squatPhase = val;
    });

    SettingsState.settingsState.squatPhaseNumber = val;
  }

  void setBenchPressPhase(val) {
    setState(() {
      benchPressPhase = val;
    });
    
    SettingsState.settingsState.benchPressPhaseNumber = val;

  }

  void setDeadliftPhase(val) {
    setState(() {
      deadliftPhase = val;
    });

    SettingsState.settingsState.deadliftPhaseNumber = val;

  }

  @override
  Widget build(BuildContext context) {
    
    return Row( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children:[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
              child: Text(Constants.useMicroplates, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
              child: Text(Constants.selectWeightUnit, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
              child: Text(Constants.selectSquatPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
              child: Text(Constants.selectBenchPressPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 14),
              child: Text(Constants.selectDeadliftPhase, style: TextStyle(fontSize: Constants.settingsFontSize)),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
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
            ),
          ]
        )
      ]
    );
  }
}