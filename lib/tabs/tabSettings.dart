import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
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