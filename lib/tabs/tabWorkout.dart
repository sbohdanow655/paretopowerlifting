import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/PassFail.dart';
import 'package:pareto_powerlifting/classes/Settings.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class WorkoutTab extends StatefulWidget {
  Settings _settings;

  WorkoutTab(this._settings);

  @override
  State<StatefulWidget> createState() {
    return _WorkoutTabState(this._settings);
  }
}

class _WorkoutTabState extends State<WorkoutTab> {
  Settings _settings;
  ScrollController _scrollController = ScrollController();

  _WorkoutTabState(this._settings);

  Map<Weekday, IDailyPrescription> _workoutPrescriptionsByDay;
  PassFail _passFail;

  Future _setWorkoutPrescriptionAndPassFailMap() async {
    Map<Weekday, IDailyPrescription> workoutPrescription =
        await Settings.getThisWeeksWorkouts(_settings);
    PassFail passFail = await DBHelper.getPassFailFromDB();
    setState(() {
      _passFail = passFail;
      _workoutPrescriptionsByDay = workoutPrescription;
    });
  }

  @override
  void initState() {
    _setWorkoutPrescriptionAndPassFailMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_workoutPrescriptionsByDay == null || _passFail == null) {
      return Column();
    }
    List<Widget> workoutDayList = [];

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay = new WorkoutDay(
          _workoutPrescriptionsByDay[weekday], weekday, _passFail);
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
              _passFail.finishWorkoutAndIncrementWeight(_settings);
              _setWorkoutPrescriptionAndPassFailMap();
              _scrollController.animateTo(0,
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.bounceIn);
            }),
        RaisedButton(
            child: Text(Constants.RESET_EXERCISE_PHASES),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              _settings.resetExercisePhases();
              _setWorkoutPrescriptionAndPassFailMap();
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
