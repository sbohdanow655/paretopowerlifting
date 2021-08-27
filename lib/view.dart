import 'package:flutter/material.dart';
import 'assets/constants.dart';

import 'routes/mainPage.dart';
import 'routes/startPage.dart';

class View extends StatelessWidget {  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        Constants.routeStartPage : (context) => StartPage(),
        Constants.routeMainPage : (context) => MainPage(),
      },
      title: Constants.title,
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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(Constants.title),
          titleTextStyle: TextStyle(fontSize: Constants.titleFontSize),
        ),
        body: StartPage()
        )
    );
  }
}