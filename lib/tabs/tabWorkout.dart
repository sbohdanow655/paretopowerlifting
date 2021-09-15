import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class WorkoutTab extends StatefulWidget {
  WeeklyExercisePrescription _weeklyExercisePrescription;

  WorkoutTab(this._weeklyExercisePrescription);

  @override
  State<StatefulWidget> createState() {
    return _WorkoutTabState(this._weeklyExercisePrescription);
  }
}

class _WorkoutTabState extends State<WorkoutTab> {
  WeeklyExercisePrescription _weeklyExercisePrescription;

  _WorkoutTabState(this._weeklyExercisePrescription);

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay =
          new WorkoutDay(_weeklyExercisePrescription, weekday);
      workoutDayList.add(workoutDay);
    });

    workoutDayList
        .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
            child: Text(Constants.FINISH_WORKOUT_WEEK),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _weeklyExercisePrescription.advanceWeek();
              });
              _scrollController.animateTo(0,
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.bounceIn);
            }),
        RaisedButton(
            child: Text(Constants.RESET_EXERCISE_PHASES),
            color: Colors.red[400],
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _weeklyExercisePrescription.resetExercisePhases();
              });
              _scrollController.animateTo(0,
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.bounceIn);
            })
      ])
    ]));

    return SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: const Color(0xfff5f5f5),
            child: Column(
                key: UniqueKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: workoutDayList)));
  }
}
