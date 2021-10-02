import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class WorkoutTab extends StatefulWidget {
  WorkoutTab();

  @override
  State<StatefulWidget> createState() {
    return _WorkoutTabState(WeeklyExercisePrescription.getInstance());
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
      content: Text(Constants.WORKOUTS_SNACKBAR_ADVANCE,
          style: TextStyle(fontSize: Constants.FONTSIZE_SNACKBAR)),
    ));
    _rebuildAllWorkoutDays();
    setState(() {
      _weeklyExercisePrescription.advanceWeek();
    });
    _scrollToTop();
  }

  void _setIncomplete(Weekday workdayWeekday, bool workoutDayIncomplete) {
    _workoutDayIncompleteMap[workdayWeekday] = workoutDayIncomplete;
  }

  void _rebuildAllWorkoutDays() {
    List<Widget> workoutTabList = [];
    workoutTabList
        .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          child: Text(Constants.GETTINGSTARTED_TITLE,
              style:
                  TextStyle(fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE)),
          color: ThemeManager.getInstance().getPrimaryColor(),
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, Constants.ROUTE_GETTINGSTARTED);
          })
    ]));
    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(_weeklyExercisePrescription,
          weekday, _setIncomplete, _rebuildAllWorkoutDays);
      workoutTabList.add(workoutDay);
    });

    setState(() {
      _workoutTabList = workoutTabList;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(seconds: 2), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    _workoutTabList
        .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
            child: Text(Constants.FINISH_WORKOUT_WEEK,
                style: TextStyle(
                  fontSize: Constants.FONTSIZE_TAB_WORKOUTS_BUTTON,
                )),
            color: ThemeManager.getInstance().getPrimaryColor(),
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
                  content: Text(Constants.WORKOUTS_SNACKBAR_INCOMPLETE,
                      style: TextStyle(fontSize: Constants.FONTSIZE_SNACKBAR)),
                ));
              } else {
                onFinishWorkoutWeek();
              }
            }),
        RaisedButton(
          child: Text(Constants.RESET_EXERCISE_PHASES,
              style:
                  TextStyle(fontSize: Constants.FONTSIZE_TAB_WORKOUTS_BUTTON)),
          color: Colors.red[400],
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(Constants.WORKOUTS_SNACKBAR_STARTOVER_PRESSED,
                  style: TextStyle(fontSize: Constants.FONTSIZE_SNACKBAR)),
            ));
          },
          onLongPress: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(Constants.WORKOUTS_SNACKBAR_STARTOVER_LONGPRESSED,
                  style: TextStyle(fontSize: Constants.FONTSIZE_SNACKBAR)),
            ));
            _rebuildAllWorkoutDays();
            setState(() {
              _weeklyExercisePrescription.resetExercisePhases();
            });
            _scrollToTop();
          },
        )
      ])
    ]));

    return SingleChildScrollView(
        controller: _scrollController,
        child: Container(
            color: ThemeManager.getInstance().getContainerBackgroundColor(),
            child: Column(
                key: UniqueKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _workoutTabList)));
  }
}
