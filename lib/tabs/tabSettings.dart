import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/WeekdayDropdown.dart';
import '../assets/constants.dart';

class SettingsTab extends StatefulWidget {
  WeeklyExercisePrescription _weeklyExercisePrescription;

  SettingsTab(this._weeklyExercisePrescription);

  @override
  State<StatefulWidget> createState() {
    return _SettingsTabState(this._weeklyExercisePrescription);
  }
}

class _SettingsTabState extends State<SettingsTab> {
  WeeklyExercisePrescription _weeklyExercisePrescription;

  TextEditingController _txtSquat = TextEditingController();
  TextEditingController _txtBenchPress = TextEditingController();
  TextEditingController _txtDeadlift = TextEditingController();
  TextEditingController _txtOverheadPress = TextEditingController();
  TextEditingController _txtPendlayRow = TextEditingController();
  TextEditingController _txtSkullcrushers = TextEditingController();

  _SettingsTabState(this._weeklyExercisePrescription);

  void setMicroplates(val) {
    setState(() {
      _weeklyExercisePrescription.haveMicroplates = val;
    });
  }

  void setWeightUnit(val) {
    setState(() {
      _weeklyExercisePrescription.weightUnit = val;
    });
  }

  void setSquatPhase(val) {
    setState(() {
      _weeklyExercisePrescription.squatPhase = val;
    });
  }

  void setBenchPressPhase(val) {
    setState(() {
      _weeklyExercisePrescription.benchPressPhase = val;
    });
  }

  void setDeadliftPhase(val) {
    setState(() {
      _weeklyExercisePrescription.deadliftPhase = val;
    });
  }

  Future setWeights() async {
    if (this.widget != null) {
      setState(() {
        _txtSquat.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.Squat);
        _txtBenchPress.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.BenchPress);
        _txtDeadlift.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.Deadlift);
        _txtOverheadPress.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.OverheadPress);
        _txtPendlayRow.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.PendlayRow);
        _txtSkullcrushers.text =
            _weeklyExercisePrescription.getNextWeight(Exercise.Skullcrushers);
      });
    }
  }

  @override
  void initState() {
    setWeights();
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
                                value:
                                    _weeklyExercisePrescription.haveMicroplates,
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
                                value: _weeklyExercisePrescription.weightUnit,
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
                                value: _weeklyExercisePrescription.squatPhase,
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
                                value:
                                    _weeklyExercisePrescription.benchPressPhase,
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
                                value:
                                    _weeklyExercisePrescription.deadliftPhase,
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
                            WeekdayDropdown(WorkoutType.FullBody1,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.FullBody2,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.FullBody3,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.LowerBody1,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.UpperBody1,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.LowerBody2,
                                _weeklyExercisePrescription)
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
                            WeekdayDropdown(WorkoutType.UpperBody2,
                                _weeklyExercisePrescription)
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
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.Squat, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtBenchPress,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_BENCHPRESS),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.BenchPress, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtDeadlift,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_DEADLIFT),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.Deadlift, val))),
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
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.OverheadPress, val))),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                          child: TextField(
                              controller: _txtPendlayRow,
                              decoration: InputDecoration(
                                  labelText: Constants.ENTERWEIGHT_PENDLAYROW),
                              maxLength: 6,
                              keyboardType: TextInputType.number,
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.PendlayRow, val))),
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
                              onChanged: (val) => _weeklyExercisePrescription
                                  .setNextWeight(Exercise.Skullcrushers, val))),
                    ]))));
  }
}
