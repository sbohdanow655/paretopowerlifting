import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
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
  WeeklyExercisePrescription _weeklyExercisePrescription =
      WeeklyExercisePrescription();

  _MainPageState() {
    tabViews = [
      WorkoutTab(_weeklyExercisePrescription),
      // HistoryTab(),
      SettingsTab(_weeklyExercisePrescription)
    ];
  }

  List<Widget> tabViews;

  int currentTabIndex = 0;

  void navigateToTab(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void fetchFromDB() async {
    DBHelper.updateWeeklyExercisePrescriptionFromDB(
        _weeklyExercisePrescription);
    _weeklyExercisePrescription.passFail = await DBHelper.getPassFailFromDB();
  }

  @override
  void initState() {
    fetchFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Constants.TITLE)),
        body: tabViews[currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            backgroundColor: Colors.blue,
            currentIndex: currentTabIndex,
            onTap: navigateToTab,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center), title: Text("Workouts")),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.history),
              //   title: Text("History")
              // ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text("Settings"))
            ]));
  }
}
