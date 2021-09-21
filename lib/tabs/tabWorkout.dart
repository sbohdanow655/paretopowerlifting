import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
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
  Map<Weekday, bool> _workoutDayIncompleteMap = {};
  List<Widget> _workoutTabList = [];

  @override
  void initState() {
    _rebuildAllWorkoutDays();
    super.initState();
  }

  void onFinishWorkoutWeek() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(Constants.WORKOUTS_SNACKBAR_ADVANCE),
    ));
    setState(() {
      _weeklyExercisePrescription.advanceWeek();
    });
  }

  void _setIncomplete(Weekday workdayWeekday, bool workoutDayIncomplete) {
    _workoutDayIncompleteMap[workdayWeekday] = workoutDayIncomplete;
  }

  void _rebuildAllWorkoutDays() {
    List<Widget> workoutTabList = [];
    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(_weeklyExercisePrescription,
          weekday, _setIncomplete, _rebuildAllWorkoutDays);
      workoutTabList.add(workoutDay);
    });

    setState(() {
      _workoutTabList = workoutTabList;
    });
  }

  @override
  Widget build(BuildContext context) {
    _workoutTabList
        .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
            child: Text(Constants.FINISH_WORKOUT_WEEK,
                style: TextStyle(
                    fontSize: Constants.FONTSIZE_TAB_WORKOUTS_BUTTON)),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              bool weekIsIncomplete = false;
              _workoutDayIncompleteMap
                  .forEach((Weekday weekday, bool isIncomplete) {
                if (isIncomplete) {
                  weekIsIncomplete = true;
                }
              });

              if (weekIsIncomplete) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(Constants.WORKOUTS_SNACKBAR_INCOMPLETE),
                ));
              } else {
                onFinishWorkoutWeek();
              }
            }),
        RaisedButton(
            child: Text(Constants.RESET_EXERCISE_PHASES,
                style: TextStyle(
                    fontSize: Constants.FONTSIZE_TAB_WORKOUTS_BUTTON)),
            color: Colors.red[400],
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(Constants.WORKOUTS_SNACKBAR_STARTOVER),
              ));
              setState(() {
                _weeklyExercisePrescription.resetExercisePhases();
              });
            })
      ])
    ]));

    return SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: Constants.BACKGROUND_GREY,
            child: Column(
                key: UniqueKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _workoutTabList)));
  }
}
