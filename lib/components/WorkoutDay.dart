import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';

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
    List<Widget> columnList = [];

    columnList.add(
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(Constants.weekdayStrings[_weekday],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: Constants.workoutTabWeekdayFontSize),
          )
        ]
      ) 
    );

    _dailyPrescription.toTupleList().forEach((tuple) {    
      List<Widget> children = [];
      
      if (tuple.exercise == Constants.restDay) {
        columnList.add(Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(tuple.prescriptionString, style: TextStyle(fontStyle: FontStyle.italic, fontSize: Constants.workoutTabWeekdayFontSize))
            ],
          )
        ));
      } else {
        children.add(Text(tuple.prescriptionString, style: TextStyle(fontSize: Constants.workoutTabWeekdayFontSize)));
        children.add(
          Checkbox(
            value: _prescriptionPassMap[tuple.exercise],
            onChanged: (isChecked) => ( setPrescriptionPass(tuple.exercise, isChecked) ))
        );
      }
      
      columnList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children 
        )
      );
    });

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: Column(children: columnList)
    ); 
      

  }
}