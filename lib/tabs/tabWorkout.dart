import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class WorkoutTab extends StatefulWidget {
  WorkoutTab();

  @override
  State<StatefulWidget> createState() {
    return _WorkoutTabState();
  }
}

class _WorkoutTabState extends State<WorkoutTab> {

  Map<Weekday, Map<Exercise, bool>> _passFailMap = {};
  Map<Weekday, IDailyPrescription> _workoutPrescriptionsByDay = Settings.getInstance().getThisWeeksWorkouts();

  @override
  Widget build(BuildContext context) {
    Weekday.values.forEach((weekday) {
      _passFailMap[weekday] = {};
      Exercise.values.forEach((exercise) {
        _passFailMap[weekday][exercise] = false;
      });
    });
    
    List<Widget> workoutDayList = [];
  
    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(_workoutPrescriptionsByDay[weekday],  weekday, _passFailMap);
      workoutDayList.add(workoutDay);
    });

    workoutDayList.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(Constants.FINISH_WORKOUT_WEEK),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _workoutPrescriptionsByDay = Settings.getInstance().finishWorkoutAndIncrementWeight(_passFailMap, false);
                  });
                }
              ),
              RaisedButton(
                child: Text(Constants.RESET_EXERCISE_PHASES),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  setState(() {
                    _workoutPrescriptionsByDay = Settings.getInstance().finishWorkoutAndIncrementWeight(_passFailMap, true);
                  });
                }
              )
            ]
          )
        ]
      )
    );

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        color: const Color(0xfff5f5f5),
        child: Column(
            key: UniqueKey(),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: workoutDayList 
          )
      )
    );
  }
}