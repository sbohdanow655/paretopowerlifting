import 'package:flutter/material.dart';
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

  void setForceFourDaySplit(val) {
    setState(() {
      _weeklyExercisePrescription.forceFourDaySplit = val;
    });
  }

  void setEnableCurls(val) {
    setState(() {
      _weeklyExercisePrescription.enableCurls = val;
    });
  }

  void setEnableHIITConditioning(val) {
    setState(() {
      _weeklyExercisePrescription.enableHIITConditioning = val;
    });
  }

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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants.SETTINGS_HEADER_PLATES,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(Constants.USE_MICROPLATES,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      Constants.LIGHT_PRIMARY),
                                          value: _weeklyExercisePrescription
                                              .haveMicroplates,
                                          onChanged: (bool value) =>
                                              setMicroplates(value))
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                                child: Text(value.toString()));
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants.SETTINGS_HEADER_WEIGHTS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                EnterWeight(_weeklyExercisePrescription,
                                    Exercise.Squat, Constants.EXERCISE_SQUAT),
                                Divider(color: Constants.DIVIDER_GREY),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.BenchPress,
                                    Constants.EXERCISE_BENCHPRESS),
                                Divider(color: Constants.DIVIDER_GREY),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.Deadlift,
                                    Constants.EXERCISE_DEADLIFT),
                                Divider(color: Constants.DIVIDER_GREY),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.OverheadPress,
                                    Constants.EXERCISE_OVERHEADPRESS),
                                Divider(color: Constants.DIVIDER_GREY),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.PendlayRow,
                                    Constants.EXERCISE_PENDLAYROW),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_OPTIONALEXERCISES,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants.ENABLE_HIITCONDITIONING,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      Constants.LIGHT_PRIMARY),
                                          value: _weeklyExercisePrescription
                                              .enableHIITConditioning,
                                          onChanged: (bool value) =>
                                              setEnableHIITConditioning(value))
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(Constants.ENABLE_CURLS,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      Constants.LIGHT_PRIMARY),
                                          value: _weeklyExercisePrescription
                                              .enableCurls,
                                          onChanged: (bool value) =>
                                              setEnableCurls(value))
                                    ])
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_FULLBODYWORKOUTDAYS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                Divider(color: Constants.DIVIDER_GREY),
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
                                Divider(color: Constants.DIVIDER_GREY),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_FORCEFOURDAYSPLIT,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(Constants.FORCEFOURDAYSPLIT,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: Colors.white,
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      Constants.LIGHT_PRIMARY),
                                          value: _weeklyExercisePrescription
                                              .forceFourDaySplit,
                                          onChanged: (bool value) =>
                                              setForceFourDaySplit(value))
                                    ])
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_UPPERLOWERWORKOUTDAYS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                      WeekdayDropdown(WorkoutType.LowerBody1,
                                          _weeklyExercisePrescription)
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                      WeekdayDropdown(WorkoutType.UpperBody1,
                                          _weeklyExercisePrescription)
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                      WeekdayDropdown(WorkoutType.LowerBody2,
                                          _weeklyExercisePrescription)
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                      WeekdayDropdown(WorkoutType.UpperBody2,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_EXERCISEPHASES,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(Constants.SELECTPHASE_SQUAT,
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
                                                child: Text(value.toString()));
                                          }).toList()),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 15),
                                        child: Text(
                                            Constants.SELECTPHASE_BENCHPRESS,
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
                                                child: Text(value.toString()));
                                          }).toList()),
                                    ]),
                                Divider(color: Constants.DIVIDER_GREY),
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
                                                child: Text(value.toString()));
                                          }).toList()),
                                    ]),
                              ])),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                                child: Text(Constants.GETTINGSTARTED_TITLE,
                                    style: TextStyle(
                                        fontSize: Constants
                                            .FONTSIZE_GETTINGSTARTED_TITLE)),
                                color: Constants.LIGHT_PRIMARY,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Constants.ROUTE_GETTINGSTARTED);
                                })
                          ])
                    ]))));
  }
}
