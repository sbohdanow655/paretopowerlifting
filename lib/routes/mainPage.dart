import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/tabs/tabExercises.dart';
import 'package:pareto_powerlifting/tabs/tabHistory.dart';
import '../assets/constants.dart';
import '../tabs/tabWorkout.dart';
import '../tabs/tabSettings.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  WeeklyExercisePrescription _weeklyExercisePrescription;

  _MainPageState();

  List<Widget> tabViews = [];

  int currentTabIndex = 3;

  void navigateToTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void fetchFromDB() async {
    if (_weeklyExercisePrescription == null) {
      WeeklyExercisePrescription weeklyExercisePrescription =
          WeeklyExercisePrescription();
      DBHelper.updateWeeklyExercisePrescriptionFromDB(
              weeklyExercisePrescription)
          .then((value) {
        DBHelper.updatePassFailFromDB(weeklyExercisePrescription.passFail)
            .then((value) {
          tabViews = [
            WorkoutTab(weeklyExercisePrescription),
            HistoryTab(),
            ExercisesTab(),
            SettingsTab(weeklyExercisePrescription)
          ];

          setState(() {
            _weeklyExercisePrescription = weeklyExercisePrescription;
          });
        });
      });
    }
  }

  @override
  void initState() {
    fetchFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_weeklyExercisePrescription == null) {
      return Center();
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(Constants.TITLE,
                style: TextStyle(fontSize: Constants.FONTSIZE_TITLE)),
            centerTitle: true),
        body: tabViews[currentTabIndex],
        backgroundColor: Constants.BACKGROUND_GREY,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            backgroundColor: Constants.LIGHT_PRIMARY,
            currentIndex: currentTabIndex,
            onTap: navigateToTab,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center),
                  title: Text(Constants.TAB_WORKOUTS,
                      style:
                          TextStyle(fontSize: Constants.FONTSIZE_TAB_TITLE))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  title: Text(Constants.TAB_HISTORY,
                      style:
                          TextStyle(fontSize: Constants.FONTSIZE_TAB_TITLE))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.accessibility),
                  title: Text(Constants.TAB_EXERCISES,
                      style:
                          TextStyle(fontSize: Constants.FONTSIZE_TAB_TITLE))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text(Constants.TAB_SETTINGS,
                      style: TextStyle(fontSize: Constants.FONTSIZE_TAB_TITLE)))
            ]));
  }
}
