import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/ExerciseLog.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
import 'package:pareto_powerlifting/components/WeightGraph.dart';

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
    Widget placeholderNoHistory =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Text(Constants.HISTORY_NOHISTORY,
              style: TextStyle(
                  fontSize: Constants.FONTSIZE_TAB_HISTORY_EXERCISELOG)))
    ]);

    Widget placeHolderNoGraph = Center();

    String currentDateString = "";

    Widget exerciseLogsColumn = Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _exerciseLogList.map((exerciseLog) {
          List<Widget> logColumnChildren = [];

          if (currentDateString != exerciseLog.savedDateString) {
            currentDateString = exerciseLog.savedDateString;
            logColumnChildren.add(
                Divider(color: ThemeManager.getInstance().getDividerColor()));
            logColumnChildren.add(Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(Constants.DATESTRING_PREFIX_WEEKOF + currentDateString,
                      style: TextStyle(
                          fontSize: Constants.FONTSIZE_TAB_HISTORY_EXERCISELOG,
                          color:
                              ThemeManager.getInstance().getPrimaryTextColor(),
                          fontWeight: FontWeight.bold))
                ])));
          }

          logColumnChildren.add(
              Divider(color: ThemeManager.getInstance().getDividerColor()));
          logColumnChildren.add(Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(exerciseLog.toExerciseString(),
                            style: TextStyle(
                                fontSize:
                                    Constants.FONTSIZE_TAB_HISTORY_EXERCISELOG,
                                color: ThemeManager.getInstance()
                                    .getPrimaryTextColor())),
                        Text(" " + exerciseLog.toPrescriptionString(),
                            style: TextStyle(
                                fontSize:
                                    Constants.FONTSIZE_TAB_HISTORY_EXERCISELOG,
                                color: ThemeManager.getInstance()
                                    .getSecondaryTextColor())),
                      ],
                    ),
                    Text(exerciseLog.passFailString,
                        style: TextStyle(
                            fontSize:
                                Constants.FONTSIZE_TAB_HISTORY_EXERCISELOG))
                  ])));

          return Column(children: logColumnChildren);
        }).toList());

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
                          _selectedExercise == MainExercise.All
                              ? placeHolderNoGraph
                              : WeightGraph(_exerciseLogList),
                          _exerciseLogList.length == 0
                              ? placeholderNoHistory
                              : exerciseLogsColumn
                        ])))));
  }
}
