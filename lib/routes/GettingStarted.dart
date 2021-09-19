import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/routes/mainPage.dart';

class GettingStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GettingStartedState();
  }
}

class _GettingStartedState extends State<GettingStarted> {
  _GettingStartedState();

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [];

    Container header = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    Constants.SETTINGS_HEADER_TITLE,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_ONE)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_TWO)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_THREE)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_FOUR)),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.WORKOUTS_HEADER_FIVE)),
        ]));

    contents.add(header);

    Container nutritionRecommendations = Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    Constants.WORKOUTS_HEADER_TITLE_NUTRITION,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Constants.FONTSIZE_TAB_WORKOUTS),
                  ))
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(Constants.NUTRITION_RECOMMOMENDATIONS)),
        ]));

    contents.add(nutritionRecommendations);

    contents.add(Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton(
          child: Text(Constants.GETTINGSTARTED_START),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          })
    ]));

    return Scaffold(
        appBar: AppBar(title: Text(Constants.TITLE), centerTitle: true),
        body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                color: Constants.BACKGROUND_GREY,
                child: Column(
                    key: UniqueKey(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contents))));
  }
}
