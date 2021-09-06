import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';

class WorkoutDay extends StatefulWidget {
  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  final Map<String, Map<String, bool>> _passFailMap;

  WorkoutDay(this._dailyPrescription, this._weekday, this._passFailMap);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(
        this._dailyPrescription, this._weekday, this._passFailMap);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._dailyPrescription, this._weekday, this._passFailMap);

  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  Map<String, Map<String, bool>> _passFailMap;

  void setPassFailMap(Exercise exercise, bool didPass) {
    Settings.getInstance().setPassFail(_weekday, exercise, didPass);

    setState(() {
      _passFailMap[_weekday.toString()][exercise.toString()] = didPass;
    });
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
            value: _passFailMap[_weekday.toString()][tuple.exercise.toString()]
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
