import 'package:flutter/material.dart';
import '../assets/constants.dart';
import '../presenter.dart';

class Settings extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<Settings> {
  
  bool haveMicroplates = false;

  String unitWeight = Constants.weightUnitLbs;

  int squatPhase = 1;
  int benchPressPhase = 1;
  int deadliftPhase = 1;

  void setMicroplates(val) {
    setState(() {
      haveMicroplates = val;
    });
  }

  void setWeightUnit(val) {
    setState(() {
      unitWeight = val;
    });
  }

  void setSquatPhase(val) {
    setState(() {
      squatPhase = val;
    });
  }

  void setBenchPressPhase(val) {
    setState(() {
      benchPressPhase = val;
    });
  }

  void setDeadliftPhase(val) {
    setState(() {
      deadliftPhase = val;
    });
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
                  value: haveMicroplates,
                  onChanged: (bool value) {
                    setState(() {
                      haveMicroplates = value;
                    });
                  },
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child:  
                DropdownButton<String>(
                  value: unitWeight,
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