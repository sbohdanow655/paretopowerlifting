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
  WeeklyExercisePrescription _weeklyExercisePrescription;

  _MainPageState();

  List<Widget> tabViews = [];

  int currentTabIndex = 1;

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
            // HistoryTab(),
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
        appBar: AppBar(title: Text(Constants.TITLE), centerTitle: true),
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
