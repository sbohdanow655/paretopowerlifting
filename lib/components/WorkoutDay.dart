import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/PassFail.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';

class WorkoutDay extends StatefulWidget {
  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  final PassFail _passFail;

  WorkoutDay(this._dailyPrescription, this._weekday, this._passFail);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(
        this._dailyPrescription, this._weekday, this._passFail);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._dailyPrescription, this._weekday, this._passFail);

  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  final PassFail _passFail;

  void setPassFailMap(Exercise exercise, bool didPass) {
    setState(() {
      _passFail.setSinglePassFail(_weekday, exercise, didPass);
    });
    DBHelper.savePassFailMapToDB(_passFail);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> columnList = [];

    columnList.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        Constants.weekdayStrings[_weekday],
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
      )
    ]));

    _dailyPrescription.toTupleList().forEach((tuple) {
      List<Widget> children = [];

      if (tuple.exercise == Exercise.Rest) {
        columnList.add(Padding(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(tuple.prescriptionString,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS))
              ],
            )));
      } else {
        children.add(Text(tuple.prescriptionString,
            style: TextStyle(fontSize: Constants.FONTSIZE_TAB_WORKOUTS)));
        children.add(DropdownButton<String>(
            value: _passFail.getSinglePassFail(_weekday, tuple.exercise)
                ? Constants.PASS
                : Constants.FAIL,
            style: TextStyle(
                color: Colors.black, fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
            onChanged: (val) {
              setPassFailMap(tuple.exercise, val == Constants.PASS);
            },
            items: <String>[Constants.FAIL, Constants.PASS]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                  value: value, child: Text(value.toString()));
            }).toList()));
      }

      columnList.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children));
    });

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(children: columnList));
  }
}
