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
  Map<Weekday, IDailyPrescription> _workoutPrescriptionsByDay;

  Map<String, Map<String, bool>> _passFailMap;

  Future _setWorkoutPrescriptionByDayFromSettings() async {
    Map<Weekday, IDailyPrescription> workoutPrescriptionsByDay =
        await Settings.getInstance().getThisWeeksWorkouts();
    setState(() {
      _workoutPrescriptionsByDay = workoutPrescriptionsByDay;
    });
  }

  Future _setPassFailMapFromSettings() async {
    Map<String, Map<String, bool>> passFailMap =
        await Settings.getInstance().getPassFailFromDB();
    setState(() {
      _passFailMap = passFailMap;
    });
  }

  @override
  void initState() {
    _setPassFailMapFromSettings();
    _setWorkoutPrescriptionByDayFromSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(
          _workoutPrescriptionsByDay[weekday], weekday, _passFailMap);
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
              Settings.getInstance().finishWorkoutAndIncrementWeight();
              _setWorkoutPrescriptionByDayFromSettings();
            }),
        RaisedButton(
            child: Text(Constants.RESET_EXERCISE_PHASES),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Settings.getInstance().resetExercisePhases();
              _setWorkoutPrescriptionByDayFromSettings();
            })
      ])
    ]));

    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            color: const Color(0xfff5f5f5),
            child: Column(
                key: UniqueKey(),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: workoutDayList)));
  }
}
