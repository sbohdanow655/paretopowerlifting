import 'package:flutter/material.dart';
import '../assets/constants.dart';

class BeginnerInfo extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Constants.marginHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText1),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText3),
              ),
            ]
          )
        )
      )
    );
  }
}