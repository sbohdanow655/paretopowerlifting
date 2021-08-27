import 'package:flutter/material.dart';
import '../assets/constants.dart';
import '../tabs/tabSettings.dart';

class MainPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Constants.title),
          titleTextStyle: TextStyle(fontSize: Constants.titleFontSize),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fitness_center) ),
              Tab(icon: Icon(Icons.history) ),
              Tab(icon: Icon(Icons.settings) ),
            ],
          ),
        ),
        body: Settings()
      ),
    );
  }
}