import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/RadioButtonGroup.dart';

class WorkoutDay extends StatefulWidget {
  final WeeklyExercisePrescription _weeklyExercisePrescription;
  final Weekday _weekday;
  final Function _setIncomplete;
  final Function _rebuildAllWorkoutDays;
  WorkoutDay(this._weeklyExercisePrescription, this._weekday,
      this._setIncomplete, this._rebuildAllWorkoutDays);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(this._weeklyExercisePrescription, this._weekday,
        this._setIncomplete, this._rebuildAllWorkoutDays);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._weeklyExercisePrescription, this._weekday,
      this._setIncomplete, this._rebuildAllWorkoutDays);

  final WeeklyExercisePrescription _weeklyExercisePrescription;
  final Weekday _weekday;
  final Function _setIncomplete;
  final Function _rebuildAllWorkoutDays;
  void _setPassFailMap(Exercise exercise, String passFail) {
    _weeklyExercisePrescription.setSinglePassFail(_weekday, exercise, passFail);
    _setIncomplete(_weekday, passFail == Constants.LIFT);
    _rebuildAllWorkoutDays();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool weekdayIsIncomplete = false;

    List<Widget> columnList = [];

    columnList.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        Constants.weekdayStrings[_weekday],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Constants.FONTSIZE_TAB_WORKOUTS_WEEKDAY,
            color: ThemeManager.getInstance().getPrimaryTextColor()),
      )
    ]));

    _weeklyExercisePrescription
        .getDailyPrescriptionByWeekday(_weekday)
        .toTupleList()
        .forEach((tuple) {
      String singlePassFail = _weeklyExercisePrescription.getSinglePassFail(
          _weekday, tuple.exercise);

      List<Widget> rowItems = [];

      if (tuple.exercise == Exercise.Rest) {
        columnList
            .add(Divider(color: ThemeManager.getInstance().getDividerColor()));
        columnList.add(Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tuple.toString(),
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS_WEEKDAY,
                        color:
                            ThemeManager.getInstance().getPrimaryTextColor()))
              ],
            )));
      } else {
        SingleExercisePrescription prescription =
            tuple.singleExercisePrescription;
        String exerciseString =
            Constants.exerciseStrings[prescription.exercise];
        String prescriptionString = prescription.weight +
            prescription.weightUnit +
            " " +
            prescription.numSets.toString() +
            "x" +
            prescription.numReps.toString();

        if (tuple.exercise == Exercise.HIITConditioning) {
          prescriptionString =
              prescription.numSets.toString() + "x 15s/45s Intervals";
        }

        if (tuple.exercise == Exercise.Curls ||
            tuple.exercise == Exercise.Skullcrushers) {
          prescriptionString = prescription.numSets.toString() +
              "x" +
              prescription.numReps.toString();
        }

        Column prescriptionColumn = Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exerciseString,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_TAB_WORKOUTS_EXERCISE,
                      color: ThemeManager.getInstance().getPrimaryTextColor())),
              Text(prescriptionString,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_TAB_WORKOUTS_PRESCRIPTION,
                      color:
                          ThemeManager.getInstance().getSecondaryTextColor())),
            ]);

        rowItems.add(prescriptionColumn);

        if (Constants.exerciseByMainExercise.containsValue(tuple.exercise)) {
          if (singlePassFail == Constants.LIFT) {
            _setIncomplete(_weekday, true);
          }

          rowItems.add(RadioButtonGroup(
              [Constants.LIFT, Constants.FAIL, Constants.PASS], singlePassFail,
              (val) {
                _setPassFailMap(tuple.exercise, val);
              }));

      if (tuple.exercise != Exercise.Rest) {
        columnList
            .add(Divider(color: ThemeManager.getInstance().getDividerColor()));
      }

      columnList.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: rowItems)));
    });

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(children: columnList));
  }
}
