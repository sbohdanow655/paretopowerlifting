import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';

class GettingStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GettingStartedState();
  }
}

class _GettingStartedState extends State<GettingStarted> {
  _GettingStartedState();

  ScrollController _scrollController = ScrollController();
  bool _isDarkMode = false;

  void _fetchWeeklyPrescriptionFromDB() async {
    WeeklyExercisePrescription weeklyExercisePrescription =
        WeeklyExercisePrescription();
    DBHelper.updateWeeklyExercisePrescriptionFromDB(weeklyExercisePrescription)
        .then((value) {
      DBHelper.updatePassFailFromDB(weeklyExercisePrescription.passFail)
          .then((value) {
        WeeklyExercisePrescription.init(weeklyExercisePrescription);
        setState(() {
          _isDarkMode = weeklyExercisePrescription.darkMode;
        });
      });
    });
  }

  @override
  void initState() {
    _fetchWeeklyPrescriptionFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [];

    Container missionStatement = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: ThemeManager.getInstance().getContainerBackgroundColor(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(Constants.MISSIONSTATEMENT_TITLE,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE,
                          color: ThemeManager.getInstance()
                              .getPrimaryTextColor()))),
            ],
          ),
          Divider(color: ThemeManager.getInstance().getDividerColor()),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.MISSIONSTATEMENT_BODY,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_GETTINGSTARTED_BODY,
                      color: ThemeManager.getInstance().getPrimaryTextColor())))
        ]));

    contents.add(missionStatement);

    Container gettingStarted = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: ThemeManager.getInstance().getContainerBackgroundColor(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(Constants.GETTINGSTARTED_TITLE,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE,
                          color: ThemeManager.getInstance()
                              .getPrimaryTextColor())))
            ],
          ),
          Column(
              children: Constants.GETTINGSTARTED_BODY.map((text) {
            return Column(children: [
              Divider(color: ThemeManager.getInstance().getDividerColor()),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(text,
                      style: TextStyle(
                          fontSize: Constants.FONTSIZE_GETTINGSTARTED_BODY,
                          color: ThemeManager.getInstance()
                              .getPrimaryTextColor())))
            ]);
          }).toList())
        ]));

    contents.add(gettingStarted);

    Container nutritionRecommendations = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: ThemeManager.getInstance().getContainerBackgroundColor(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    Constants.GETTINGSTARTED_TITLE_NUTRITION,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE,
                        color:
                            ThemeManager.getInstance().getPrimaryTextColor()),
                  ))
            ],
          ),
          Divider(color: ThemeManager.getInstance().getDividerColor()),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.NUTRITION_RECOMMOMENDATIONS,
                  style: TextStyle(
                      fontSize: Constants.FONTSIZE_GETTINGSTARTED_BODY,
                      color: ThemeManager.getInstance().getPrimaryTextColor())))
        ]));

    contents.add(nutritionRecommendations);

    contents.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          child: Text(
            Constants.GETTINGSTARTED_START,
            style: TextStyle(fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE),
          ),
          color: ThemeManager.getInstance().getPrimaryColor(),
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              Constants.ROUTE_MAINPAGE,
            );
          })
    ]));

    return Scaffold(
        appBar: AppBar(
            title: Text(Constants.TITLE,
                style: TextStyle(
                    fontSize: Constants.FONTSIZE_GETTINGSTARTED_TITLE)),
            centerTitle: true),
        backgroundColor: ThemeManager.getInstance().getBackgroundColor(),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: ThemeManager.getInstance().getBackgroundColor(),
                child: Column(
                    key: UniqueKey(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contents))));
  }
}
