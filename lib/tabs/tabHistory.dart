import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/ExerciseLog.dart';

class HistoryTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryTabState();
  }
}

class _HistoryTabState extends State<HistoryTab> {
  MainExercise _selectedExercise = MainExercise.All;
  List<ExerciseLog> _exerciseLogList = [];

  void _setSelectedExercise(MainExercise mainExercise) async {
    await _getExercisePrescriptions(mainExercise);
    setState(() {
      _selectedExercise = mainExercise;
    });
  }

  Future _getExercisePrescriptions(MainExercise mainExercise) async {
    List<ExerciseLog> exerciseLogList =
        await DBHelper.getExerciseLogs(mainExercise);
    setState(() {
      _exerciseLogList = exerciseLogList;
    });
  }

  @override
  void initState() {
    _getExercisePrescriptions(_selectedExercise);
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
                                Text(Constants.TAB_HISTORY,
                                    style: TextStyle(
                                        fontSize: Constants.FONTSIZE_TAB_TITLE,
                                        fontWeight: FontWeight.bold))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton<String>(
                                    value: Constants
                                        .mainExerciseStrings[_selectedExercise],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            Constants.FONTSIZE_TAB_SETTINGS),
                                    onChanged: (mainExerciseString) =>
                                        _setSelectedExercise(
                                            Constants.mainExerciseByString[
                                                mainExerciseString]),
                                    items: MainExercise.values
                                        .map<DropdownMenuItem<String>>(
                                            (MainExercise mainExercise) {
                                      return DropdownMenuItem<String>(
                                          value: Constants.mainExerciseStrings[
                                              mainExercise],
                                          child: Text(
                                              Constants.mainExerciseStrings[
                                                  mainExercise],
                                              style: TextStyle(
                                                  fontSize: Constants
                                                      .FONTSIZE_TAB_HISTORY_EXERCISELOG)));
                                    }).toList())
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: _exerciseLogList.length == 0
                                  ? [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 15),
                                          child: Text(
                                            Constants.HISTORY_NOHISTORY,
                                            style: TextStyle(
                                                fontSize: Constants
                                                    .FONTSIZE_TAB_HISTORY_EXERCISELOG),
                                          ))
                                    ]
                                  : _exerciseLogList.map((exerciseLog) {
                                      return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  exerciseLog
                                                      .toPrescriptionString(),
                                                  style: TextStyle(
                                                      fontSize: Constants
                                                          .FONTSIZE_TAB_HISTORY_EXERCISELOG)),
                                              Text(exerciseLog.passFailString,
                                                  style: TextStyle(
                                                      fontSize: Constants
                                                          .FONTSIZE_TAB_HISTORY_EXERCISELOG))
                                            ],
                                          ));
                                    }).toList()),
                        ])))));
  }
}
