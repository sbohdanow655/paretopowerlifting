import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';

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
            color: ThemeManager.getInstance().getContainerBackgroundColor(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  Constants.TAB_EXERCISES_TITLE,
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
                                    items: Constants.MAP_HOWTO.keys
                                        .map<DropdownMenuItem<String>>(
                                            (Exercise exercise) {
                                      return DropdownMenuItem<String>(
                                          value: Constants
                                              .exerciseStrings[exercise],
                                          child: Text(
                                              Constants
                                                  .exerciseStrings[exercise],
                                              style: TextStyle(
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_EXERCISES)));
                                    }).toList())
                              ]),
                          Constants.MAP_DIAGRAM_IMAGES
                                  .containsKey(_selectedExercise)
                              ? Image(
                                  image: AssetImage(Constants
                                      .MAP_DIAGRAM_IMAGES[_selectedExercise]))
                              : Center(),
                          Column(
                              children: Constants.MAP_HOWTO[_selectedExercise]
                                  .map((String text) {
                            return Column(children: [
                              Divider(
                                  color: ThemeManager.getInstance()
                                      .getDividerColor()),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                            fontSize: Constants
                                                .FONTSIZE_TAB_EXERCISES),
                                      )))
                            ]);
                          }).toList())
                        ])))));
  }
}
