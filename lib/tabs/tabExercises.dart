import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';

class ExercisesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExercisesTabState();
  }
}

class _ExercisesTabState extends State<ExercisesTab> {
  Exercise _selectedExercise = Exercise.Squat;

  void _setSelectedExercise(Exercise exercise) async {
    setState(() {
      _selectedExercise = exercise;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Constants.BACKGROUND_GREY,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (Constants.TAB_EXERCISES_PREFIX),
                                  style: TextStyle(
                                      fontSize:
                                          Constants.FONTSIZE_TAB_EXERCISES,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton<String>(
                                    value: Constants
                                        .exerciseStrings[_selectedExercise],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            Constants.FONTSIZE_TAB_EXERCISES),
                                    onChanged: (exerciseString) =>
                                        _setSelectedExercise(Constants
                                            .exerciseByString[exerciseString]),
                                    items: MainExercise.values
                                        .map<DropdownMenuItem<String>>(
                                            (MainExercise mainExercise) {
                                      return DropdownMenuItem<String>(
                                          value: Constants.exerciseStrings[
                                              Constants.exerciseByMainExercise[
                                                  mainExercise]],
                                          child: Text(
                                              Constants
                                                  .exerciseStrings[Constants
                                                      .exerciseByMainExercise[
                                                  mainExercise]],
                                              style: TextStyle(
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_EXERCISES)));
                                    }).toList())
                              ]),
                          Column(
                              children: Constants.MAP_HOWTO[_selectedExercise]
                                  .map((String text) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 15),
                                child: Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      text,
                                      style: TextStyle(
                                          fontSize:
                                              Constants.FONTSIZE_TAB_EXERCISES),
                                    )));
                          }).toList())
                        ])))));
  }
}
