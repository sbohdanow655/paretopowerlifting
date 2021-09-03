import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

class WorkoutDay extends StatefulWidget {
  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  Map<Weekday, Map<Exercise, bool>> _passFailMap;

  WorkoutDay(this._dailyPrescription, this._weekday, this._passFailMap);

  @override
  State<StatefulWidget> createState() {
    return WorkoutDayState(this._dailyPrescription, this._weekday, this._passFailMap);
  }
}

class WorkoutDayState extends State<WorkoutDay> {
  WorkoutDayState(this._dailyPrescription, this._weekday, this._passFailMap);

  final IDailyPrescription _dailyPrescription;
  final Weekday _weekday;
  Map<Weekday, Map<Exercise, bool>> _passFailMap;

  void setPrescriptionPass(Exercise exercise, bool wasPassed) {
    setState(() {
      _passFailMap[_weekday][exercise] = wasPassed;
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
      
      if (tuple.exercise == Exercise.Rest) {
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
          DropdownButton<String>(
            value: _passFailMap[_weekday][tuple.exercise] ? Constants.pass : Constants.fail,
            style: TextStyle(color: Colors.black, fontSize: Constants.settingsFontSize),
            onChanged: (val) {
              setPrescriptionPass(tuple.exercise, val == Constants.pass);
            },
            items: <String>[Constants.fail, Constants.pass]
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.toString())
                );
              }).toList()
          )
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
      child: Column(
        children: columnList)
    ); 
      

  }
}