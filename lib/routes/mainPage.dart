import 'package:flutter/material.dart';
import '../assets/constants.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Constants.title),
          titleTextStyle: TextStyle(fontSize: Constants.titleFontSize),
          bottom: TabBar(
            tabs: [
              Tab(text: Constants.tabNextWorkout),
              Tab(text: Constants.tabHistory),
            ],
          ),
        ),
      ),
    );
  }
}