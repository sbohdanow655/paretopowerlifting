import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/WorkoutSchedule.dart';

class WorkoutDay extends StatefulWidget {
  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;

  WorkoutDay(this._dailyPrescription, this._weekday);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(this._dailyPrescription, this._weekday);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._dailyPrescription, this._weekday);

  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;

  Map<String, bool> _prescriptionPassMap = {
    Constants.exerciseSquat : false,
    Constants.exerciseBenchPress : false,
    Constants.exerciseDeadlift : false,
    Constants.exerciseOverheadPress : false,
    Constants.exercisePendlayRow : false,
    Constants.exerciseSkullcrushers : false,
  };

  void setPrescriptionPass(String exercise, bool wasPassed) {
    setState(() {
      _prescriptionPassMap[exercise] = wasPassed;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> leftColumnList = [];
    List<Widget> rightColumnList = [];

    leftColumnList.add(
        Text(Constants.weekdayStrings[_weekday], style: TextStyle(fontSize: Constants.settingsFontSize))
    );

    _dailyPrescription.toTupleList().forEach((tuple) {    
      leftColumnList.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Text(tuple.prescriptionString, style: TextStyle(fontSize: Constants.settingsFontSize)),
        ),);
      if (tuple.exercise != Constants.exerciseRest) {
        rightColumnList.add(Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: _prescriptionPassMap[tuple.exercise],
              onChanged: (isChecked) => ( setPrescriptionPass(tuple.exercise, isChecked) )
            )
          ]));
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: leftColumnList
        ),
        Column(children: rightColumnList
        )
      ]
    );

  }
}