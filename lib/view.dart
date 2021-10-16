import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';
import 'package:pareto_powerlifting/routes/GettingStarted.dart';
import 'assets/constants.dart';

import 'classes/DBHelper.dart';
import 'classes/ThemeManager.dart';
import 'routes/mainPage.dart';

class View extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          Constants.ROUTE_MAINPAGE: (context) => MainPage(),
          Constants.ROUTE_GETTINGSTARTED: (context) => GettingStarted(),
        },
        title: Constants.TITLE,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: ThemeManager.getInstance().getMaterialPrimaryColor(),
        ),
        home: GettingStarted());
  }
}
