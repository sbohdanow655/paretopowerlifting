import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/EnterWeight.dart';
import 'package:pareto_powerlifting/components/WeekdayDropdown.dart';
import '../assets/constants.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab();

  @override
  State<StatefulWidget> createState() {
    return _SettingsTabState(WeeklyExercisePrescription.getInstance());
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

  void setWeightUnit(val) {
    setState(() {
      _weeklyExercisePrescription.weightUnit = val;
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
                color: ThemeManager.getInstance().getBackgroundColor(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants.SETTINGS_HEADER_PLATES,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants.SETTINGS_HEADER_WEIGHTS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                EnterWeight(_weeklyExercisePrescription,
                                    Exercise.Squat, Constants.EXERCISE_SQUAT),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.BenchPress,
                                    Constants.EXERCISE_BENCHPRESS),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.Deadlift,
                                    Constants.EXERCISE_DEADLIFT),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.OverheadPress,
                                    Constants.EXERCISE_OVERHEADPRESS),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                EnterWeight(
                                    _weeklyExercisePrescription,
                                    Exercise.PendlayRow,
                                    Constants.EXERCISE_PENDLAYROW),
                              ])),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_FULLBODYWORKOUTDAYS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_FORCEFOURDAYSPLIT,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(Constants.FORCEFOURDAYSPLIT,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: ThemeManager.getInstance()
                                              .getPrimaryColor(),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      ThemeManager.getInstance()
                                                          .getPrimaryColor()),
                                          value: _weeklyExercisePrescription
                                              .forceFourDaySplit,
                                          onChanged: (bool value) =>
                                              setForceFourDaySplit(value))
                                    ])
                              ])),
                      Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_UPPERLOWERWORKOUTDAYS,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
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
                              horizontal: Constants.MARGIN_HORIZONTAL,
                              vertical: 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: Constants.PADDING_HORIZONTAL,
                              vertical: 10),
                          color: ThemeManager.getInstance()
                              .getContainerBackgroundColor(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants
                                                .SETTINGS_HEADER_OPTIONALEXERCISES,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(
                                            Constants.ENABLE_HIITCONDITIONING,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: ThemeManager.getInstance()
                                              .getPrimaryColor(),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      ThemeManager.getInstance()
                                                          .getPrimaryColor()),
                                          value: _weeklyExercisePrescription
                                              .enableHIITConditioning,
                                          onChanged: (bool value) =>
                                              setEnableHIITConditioning(value))
                                    ]),
                                Divider(
                                    color: ThemeManager.getInstance()
                                        .getDividerColor()),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Constants.PADDING_HORIZONTAL,
                                            vertical: 15),
                                        child: Text(Constants.ENABLE_CURLS,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_SETTINGS)),
                                      ),
                                      Checkbox(
                                          checkColor: ThemeManager.getInstance()
                                              .getPrimaryColor(),
                                          fillColor:
                                              MaterialStateProperty.resolveWith(
                                                  (val) =>
                                                      ThemeManager.getInstance()
                                                          .getPrimaryColor()),
                                          value: _weeklyExercisePrescription
                                              .enableCurls,
                                          onChanged: (bool value) =>
                                              setEnableCurls(value))
                                    ])
                              ])),
                    ]))));
  }
}
