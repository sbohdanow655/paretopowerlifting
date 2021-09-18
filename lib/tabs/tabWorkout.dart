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
    List<Widget> workoutTabList = [];

    Container header = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    Constants.SETTINGS_HEADER_TITLE,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_ONE)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_TWO)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_THREE)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_FOUR)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_FIVE)),
        ]));

    workoutTabList.add(header);

    Container nutritionRecommendations = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    Constants.WORKOUTS_HEADER_TITLE_NUTRITION,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.NUTRITION_RECOMMOMENDATIONS)),
        ]));

    workoutTabList.add(nutritionRecommendations);

    Weekday.values.forEach((weekday) {
      WorkoutDay workoutDay =
          new WorkoutDay(_weeklyExercisePrescription, weekday);
      workoutTabList.add(workoutDay);
    });

    workoutTabList
        .add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        RaisedButton(
            child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(Constants.WORKOUTS_ADVANCE_INKWELL),
                  ));
                  setState(() {
                    _weeklyExercisePrescription.advanceWeek();
                  });
                },
                child: Text(Constants.FINISH_WORKOUT_WEEK)),
            disabledColor: Colors.blue,
            disabledTextColor: Colors.white),
        RaisedButton(
            child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(Constants.WORKOUTS_STARTOVER_INKWELL),
                  ));
                  setState(() {
                    _weeklyExercisePrescription.resetExercisePhases();
                  });
                },
                child: Text(Constants.RESET_EXERCISE_PHASES)),
            disabledColor: Colors.red[400],
            disabledTextColor: Colors.white)
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
                children: workoutTabList)));
  }
}
