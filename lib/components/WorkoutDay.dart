import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';

class WorkoutDay extends StatefulWidget {
  final WeeklyExercisePrescription _weeklyExercisePrescription;
  final Weekday _weekday;

  WorkoutDay(this._weeklyExercisePrescription, this._weekday);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(this._weeklyExercisePrescription, this._weekday);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._weeklyExercisePrescription, this._weekday);

  final WeeklyExercisePrescription _weeklyExercisePrescription;
  final Weekday _weekday;

  void setPassFailMap(Exercise exercise, bool didPass) {
    setState(() {
      _weeklyExercisePrescription.setSinglePassFail(
          _weekday, exercise, didPass);
    });
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
    List<Widget> columnList = [];

    columnList.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        Constants.weekdayStrings[_weekday],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Constants.FONTSIZE_TAB_WORKOUTS_WEEKDAY),
      )
    ]));

    _weeklyExercisePrescription
        .getDailyPrescriptionByWeekday(_weekday)
        .toTupleList()
        .forEach((tuple) {
      List<Widget> rowItems = [];

      if (tuple.exercise == Exercise.Rest) {
        columnList.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tuple.toString(),
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS_WEEKDAY))
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
        Column prescriptionColumn = Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exerciseString,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_TAB_WORKOUTS_EXERCISE)),
              Text(prescriptionString,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_TAB_WORKOUTS_PRESCRIPTION)),
            ]);

        rowItems.add(prescriptionColumn);

        bool didPass = _weeklyExercisePrescription.getSinglePassFail(
            _weekday, tuple.exercise);

        rowItems.add(DropdownButton<String>(
            value: didPass ? Constants.PASS : Constants.FAIL,
            style: TextStyle(
                color: Colors.black,
                fontSize: Constants.FONTSIZE_TAB_WORKOUTS_PASSFAIL),
            onChanged: (val) {
              setPassFailMap(tuple.exercise, val == Constants.PASS);
            },
            items: <String>[Constants.FAIL, Constants.PASS]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value, child: Text(value.toString()));
            }).toList()));
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
