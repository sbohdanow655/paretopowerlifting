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

  String _weightUnit = Constants.WEIGHTUNIT_LBS;

  int _squatPhase = 1;
  int _benchPressPhase = 1;
  int _deadliftPhase = 1;

  TextEditingController _txtSquat = TextEditingController();
  TextEditingController _txtBenchPress = TextEditingController();
  TextEditingController _txtDeadlift = TextEditingController();
  TextEditingController _txtOverheadPress = TextEditingController();
  TextEditingController _txtPendlayRow = TextEditingController();
  TextEditingController _txtSkullcrushers = TextEditingController();
  

  _SettingsTabState() {
  }

  void setMicroplates(val) {
    setState(() {
      _useMicroplates = val;
    });

    Settings.getInstance().useMicroplates = val;
    Settings.getInstance().saveSettings();
  }

  void setWeightUnit(val) {
    setState(() {
      _weightUnit = val;
    });

    Settings.getInstance().weightUnit = val;
    Settings.getInstance().saveSettings();

  }

  void setSquatPhase(val) {
    setState(() {
      _squatPhase = val;
    });

    Settings.getInstance().squatPhase = val;
    Settings.getInstance().saveSettings();

  }

  void setBenchPressPhase(val) {
    setState(() {
      _benchPressPhase = val;
    });
    
    Settings.getInstance().benchPressPhase = val;
    Settings.getInstance().saveSettings();

  }

  void setDeadliftPhase(val) {
    setState(() {
      _deadliftPhase = val;
    });

    Settings.getInstance().deadliftPhase = val;
    Settings.getInstance().saveSettings();

  }

  @override
  Widget build(BuildContext context) {
    
    _useMicroplates = Settings.getInstance().useMicroplates;
    _weightUnit = Settings.getInstance().weightUnit;
    _squatPhase = Settings.getInstance().squatPhase;
    _benchPressPhase = Settings.getInstance().benchPressPhase;
    _deadliftPhase = Settings.getInstance().deadliftPhase;
    _txtSquat.text = Settings.getInstance().getNextWeight(Exercise.Squat);
    _txtBenchPress.text = Settings.getInstance().getNextWeight(Exercise.BenchPress);
    _txtDeadlift.text = Settings.getInstance().getNextWeight(Exercise.Deadlift);
    _txtOverheadPress.text = Settings.getInstance().getNextWeight(Exercise.OverheadPress);
    _txtPendlayRow.text = Settings.getInstance().getNextWeight(Exercise.PendlayRow);
    _txtSkullcrushers.text = Settings.getInstance().getNextWeight(Exercise.Skullcrushers);  

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child:
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [  
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(Constants.USE_MICROPLATES, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith((val) => Colors.blue),
                  value: _useMicroplates,
                  onChanged: (bool value) => setMicroplates(value)
                )
              ]
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(Constants.SELECT_WEIGHT_UNIT, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                ),
                DropdownButton<String>(
                  value: _weightUnit,
                  style: TextStyle(color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                  onChanged: (val) => setWeightUnit(val),
                  items: <String>[Constants.WEIGHTUNIT_LBS, Constants.WEIGHTUNIT_KG]
                    .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(Constants.SELECTPHASE_SQUAT, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                ),
                DropdownButton<int>(
                  value: _squatPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                  onChanged: (val) => setSquatPhase(val),
                  items: <int>[1, 2, 3]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(Constants.SELECTPHASE_BENCHPRESS, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                ),
                DropdownButton<int>(
                  value: _benchPressPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                  onChanged: (val) => setBenchPressPhase(val),
                  items: <int>[1, 2, 3, 4]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(Constants.SELECTPHASE_DEADLIFT, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                ),
                DropdownButton<int>(
                  value: _deadliftPhase,
                  style: TextStyle(color: Colors.black, fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                  onChanged: (val) => setDeadliftPhase(val),
                  items: <int>[1, 2, 3]
                    .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString())
                      );
                    }).toList()
                ),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_FULLBODY_ONE, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.FullBody1)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_FULLBODY_TWO, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.FullBody2)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_FULLBODY_THREE, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.FullBody3)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_LOWERBODY_ONE, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.LowerBody1)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_UPPERBODY_ONE, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.UpperBody1)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_LOWERBODY_TWO, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.LowerBody2)
                ]
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    child: Text(Constants.SELECTWORKOUTDAY_UPPERBODY_TWO, style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
                  ),
                  WeekdayDropdown(WorkoutType.UpperBody2)
                ]
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtSquat, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_SQUAT), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.Squat, val)) 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtBenchPress, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_BENCHPRESS), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.BenchPress, val)) 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtDeadlift, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_DEADLIFT), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.Deadlift, val)) 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtOverheadPress, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_OVERHEADPRESS), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.OverheadPress, val)) 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtPendlayRow, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_PENDLAYROW), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.PendlayRow, val)) 
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: TextField(controller: _txtSkullcrushers, decoration: InputDecoration(labelText: Constants.ENTERWEIGHT_SKULLCRUSHERS), maxLength: 6, keyboardType: TextInputType.number, onChanged: (val) => Settings.getInstance().setNextWeight(Exercise.Skullcrushers, val)) 
              ),

            ]
        )
        )
      )
    );
  }
}