import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';
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
  _MainPageState();

  List<Widget> tabViews = [];

  int currentTabIndex = 3;

  void navigateToTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  void initState() {
    tabViews = [WorkoutTab(), HistoryTab(), ExercisesTab(), SettingsTab()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (WeeklyExercisePrescription.getInstance() == null) {
      return Center();
    }

    return Scaffold(
        appBar: AppBar(
            title: Text(Constants.TITLE,
                style: TextStyle(fontSize: Constants.FONTSIZE_TITLE)),
            centerTitle: true),
        body: tabViews[currentTabIndex],
        backgroundColor: ThemeManager.getInstance().getBackgroundColor(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            backgroundColor: ThemeManager.getInstance().getPrimaryColor(),
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
