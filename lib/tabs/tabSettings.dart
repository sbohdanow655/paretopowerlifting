import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/components/WeekdayDropdown.dart';
import '../assets/constants.dart';

class SettingsTab extends StatefulWidget {
  Settings _settings;

  SettingsTab(this._settings);

  @override
  State<StatefulWidget> createState() {
    return _SettingsTabState(this._settings);
  }
}

class _SettingsTabState extends State<SettingsTab> {
  Settings _settings;

  TextEditingController _txtSquat = TextEditingController();
  TextEditingController _txtBenchPress = TextEditingController();
  TextEditingController _txtDeadlift = TextEditingController();
  TextEditingController _txtOverheadPress = TextEditingController();
  TextEditingController _txtPendlayRow = TextEditingController();
  TextEditingController _txtSkullcrushers = TextEditingController();

  _SettingsTabState(this._settings);

  void setMicroplates(val) {
    setState(() {
      _settings.useMicroplates = val;
    });
    DBHelper.saveSettingToDB(_settings, Constants.DB_USE_MICROPLATES);
  }

  void setWeightUnit(val) {
    setState(() {
      _settings.weightUnit = val;
    });
    DBHelper.saveSettingToDB(_settings, Constants.DB_WEIGHT_UNIT);
  }

  void setSquatPhase(val) {
    setState(() {
      _settings.squatPhase = val;
    });
    DBHelper.saveSettingToDB(_settings, Constants.DB_PHASE_SQUAT);
  }

  void setBenchPressPhase(val) {
    setState(() {
      _settings.benchPressPhase = val;
    });
    DBHelper.saveSettingToDB(_settings, Constants.DB_PHASE_BENCHPRESS);
  }

  void setDeadliftPhase(val) {
    setState(() {
      _settings.deadliftPhase = val;
    });
    DBHelper.saveSettingToDB(_settings, Constants.DB_PHASE_DEADLIFT);
  }

  Future setSettingsFromDB() async {
    Settings settings = Settings();
    await DBHelper.updateSettingsFromDB(settings);
    if (this.widget != null) {
      setState(() {
        _settings = settings;
        _txtSquat.text = settings.getNextWeight(Exercise.Squat);
        _txtBenchPress.text = settings.getNextWeight(Exercise.BenchPress);
        _txtDeadlift.text = settings.getNextWeight(Exercise.Deadlift);
        _txtOverheadPress.text = settings.getNextWeight(Exercise.OverheadPress);
        _txtPendlayRow.text = settings.getNextWeight(Exercise.PendlayRow);
        _txtSkullcrushers.text = settings.getNextWeight(Exercise.Skullcrushers);
      });
    }
  }

  @override
  void initState() {
    setSettingsFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(Constants.USE_MICROPLATES,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            Checkbox(
                                checkColor: Colors.white,
                                fillColor: MaterialStateProperty.resolveWith(
                                    (val) => Colors.blue),
                                value: _settings.useMicroplates,
                                onChanged: (bool value) =>
                                    setMicroplates(value))
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(Constants.SELECT_WEIGHT_UNIT,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            DropdownButton<String>(
                                value: _settings.weightUnit,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                                onChanged: (val) => setWeightUnit(val),
                                items: <String>[
                                  Constants.WEIGHTUNIT_LBS,
                                  Constants.WEIGHTUNIT_KG
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value.toString()));
                                }).toList()),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(Constants.SELECTPHASE_SQUAT,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            DropdownButton<int>(
                                value: _settings.squatPhase,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                                onChanged: (val) => setSquatPhase(val),
                                items: <int>[1, 2, 3]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()));
                                }).toList()),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(Constants.SELECTPHASE_BENCHPRESS,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            DropdownButton<int>(
                                value: _settings.benchPressPhase,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                                onChanged: (val) => setBenchPressPhase(val),
                                items: <int>[1, 2, 3, 4]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()));
                                }).toList()),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(Constants.SELECTPHASE_DEADLIFT,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            DropdownButton<int>(
                                value: _settings.deadliftPhase,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: Constants.FONTSIZE_TAB_SETTINGS),
                                onChanged: (val) => setDeadliftPhase(val),
                                items: <int>[1, 2, 3]
                                    .map<DropdownMenuItem<int>>((int value) {
                                  return DropdownMenuItem<int>(
                                      value: value,
                                      child: Text(value.toString()));
                                }).toList()),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_FULLBODY_ONE,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.FullBody1, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_FULLBODY_TWO,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.FullBody2, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_FULLBODY_THREE,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.FullBody3, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_LOWERBODY_ONE,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.LowerBody1, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_UPPERBODY_ONE,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.UpperBody1, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_LOWERBODY_TWO,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.LowerBody2, _settings)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              child: Text(
                                  Constants.SELECTWORKOUTDAY_UPPERBODY_TWO,
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_SETTINGS)),
                            ),
                            WeekdayDropdown(WorkoutType.UpperBody2, _settings)
                          ]),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtSquat,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_SQUAT),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.Squat, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtBenchPress,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_BENCHPRESS),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.BenchPress, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtDeadlift,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_DEADLIFT),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.Deadlift, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtOverheadPress,
                              decoration: InputDecoration(
                                  labelText:
                                      Constants.ENTERWEIGHT_OVERHEADPRESS),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.OverheadPress, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtPendlayRow,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_PENDLAYROW),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.PendlayRow, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtSkullcrushers,
                              decoration: InputDecoration(
                                  labelText:
                                      Constants.ENTERWEIGHT_SKULLCRUSHERS),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _settings.setNextWeight(
                                  Exercise.Skullcrushers, val))),
                    ]))));
  }
}
