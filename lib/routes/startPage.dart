import 'package:flutter/material.dart';
import '../assets/constants.dart';
import '../presenter.dart';

class StartPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Constants.marginHorizontal),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText1, style: TextStyle(fontSize: 25))
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText2, style: TextStyle(fontSize: 25))
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText3, style: TextStyle(fontSize: 25)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Constants.textPaddingHorizontal, vertical: Constants.textPaddingVertical),
                child: Text(Constants.beginnerInfoText4, style: TextStyle(fontSize: 25)),
              ),
              ButtonTheme(
                minWidth: 200,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Constants.buttonPaddingHorizontal, vertical: Constants.buttonPaddingVertical),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: new Text(
                        Constants.startJourney,
                        style: TextStyle(fontSize: Constants.buttonFontSize),
                        ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: (){
                        Presenter.navigateToMainPage(context);
                      },
                    )
                  ),
                ),
              ),
            ],
          )
        ) 
        
      )
    );
  }
}