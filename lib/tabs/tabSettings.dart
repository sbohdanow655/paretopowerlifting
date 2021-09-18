import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/EnterWeight.dart';
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

  @override
  void initState() {
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
            child: Container(
                color: Constants.BACKGROUND_GREY,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SETTINGS_HEADER_PLATES,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants.USE_MICROPLATES,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          Checkbox(
                                              checkColor: Colors.white,
                                              fillColor: MaterialStateProperty
                                                  .resolveWith(
                                                      (val) => Colors.blue),
                                              value: _weeklyExercisePrescription
                                                  .haveMicroplates,
                                              onChanged: (bool value) =>
                                                  setMicroplates(value))
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants.SELECT_WEIGHT_UNIT,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          DropdownButton<String>(
                                              value: _weeklyExercisePrescription
                                                  .weightUnit,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_SETTINGS),
                                              onChanged: (val) =>
                                                  setWeightUnit(val),
                                              items: <String>[
                                                Constants.WEIGHTUNIT_LBS,
                                                Constants.WEIGHTUNIT_KG
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                    value: value,
                                                    child:
                                                        Text(value.toString()));
                                              }).toList()),
                                        ]),
                                  ])),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SETTINGS_HEADER_EXERCISEPHASES,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants.SELECTPHASE_SQUAT,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          DropdownButton<int>(
                                              value: _weeklyExercisePrescription
                                                  .squatPhase,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_SETTINGS),
                                              onChanged: (val) =>
                                                  setSquatPhase(val),
                                              items: <int>[1, 2, 3]
                                                  .map<DropdownMenuItem<int>>(
                                                      (int value) {
                                                return DropdownMenuItem<int>(
                                                    value: value,
                                                    child:
                                                        Text(value.toString()));
                                              }).toList()),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTPHASE_BENCHPRESS,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          DropdownButton<int>(
                                              value: _weeklyExercisePrescription
                                                  .benchPressPhase,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_SETTINGS),
                                              onChanged: (val) =>
                                                  setBenchPressPhase(val),
                                              items: <int>[1, 2, 3, 4]
                                                  .map<DropdownMenuItem<int>>(
                                                      (int value) {
                                                return DropdownMenuItem<int>(
                                                    value: value,
                                                    child:
                                                        Text(value.toString()));
                                              }).toList()),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants.SELECTPHASE_DEADLIFT,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          DropdownButton<int>(
                                              value: _weeklyExercisePrescription
                                                  .deadliftPhase,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_SETTINGS),
                                              onChanged: (val) =>
                                                  setDeadliftPhase(val),
                                              items: <int>[1, 2, 3]
                                                  .map<DropdownMenuItem<int>>(
                                                      (int value) {
                                                return DropdownMenuItem<int>(
                                                    value: value,
                                                    child:
                                                        Text(value.toString()));
                                              }).toList()),
                                        ]),
                                  ])),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SETTINGS_HEADER_FULLBODYWORKOUTDAYS,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_FULLBODY_ONE,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(WorkoutType.FullBody1,
                                              _weeklyExercisePrescription)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_FULLBODY_TWO,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(WorkoutType.FullBody2,
                                              _weeklyExercisePrescription)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_FULLBODY_THREE,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(WorkoutType.FullBody3,
                                              _weeklyExercisePrescription)
                                        ]),
                                  ])),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SETTINGS_HEADER_UPPERLOWERWORKOUTDAYS,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_LOWERBODY_ONE,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(
                                              WorkoutType.LowerBody1,
                                              _weeklyExercisePrescription)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_UPPERBODY_ONE,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(
                                              WorkoutType.UpperBody1,
                                              _weeklyExercisePrescription)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_LOWERBODY_TWO,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(
                                              WorkoutType.LowerBody2,
                                              _weeklyExercisePrescription)
                                        ]),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SELECTWORKOUTDAY_UPPERBODY_TWO,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                          WeekdayDropdown(
                                              WorkoutType.UpperBody2,
                                              _weeklyExercisePrescription)
                                        ]),
                                  ])),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 15),
                                            child: Text(
                                                Constants
                                                    .SETTINGS_HEADER_WEIGHTS,
                                                style: TextStyle(
                                                    fontSize: Constants
                                                        .FONTSIZE_TAB_SETTINGS)),
                                          ),
                                        ]),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.Squat,
                                        Constants.EXERCISE_SQUAT),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.BenchPress,
                                        Constants.EXERCISE_BENCHPRESS),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.Deadlift,
                                        Constants.EXERCISE_DEADLIFT),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.OverheadPress,
                                        Constants.EXERCISE_OVERHEADPRESS),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.PendlayRow,
                                        Constants.EXERCISE_PENDLAYROW),
                                    EnterWeight(
                                        _weeklyExercisePrescription,
                                        Exercise.Skullcrushers,
                                        Constants.EXERCISE_SKULLCRUSHERS),
                                  ])),
                        ])))));
  }
}
