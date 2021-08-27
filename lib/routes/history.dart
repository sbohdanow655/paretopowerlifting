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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Text(Constants.headerSelectProgram, style: TextStyle(fontSize: Constants.headerFontSize), textAlign: TextAlign.center),
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
                        Constants.selectNovice,
                        style: TextStyle(fontSize: Constants.buttonFontSize),
                        ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: (){ 
                        Presenter.selectProgram(context, Programs.novice);
                      },                   
                    )
                  ),
                ),
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
                        Constants.selectIntermediate,
                        style: TextStyle(fontSize: Constants.buttonFontSize),
                        ),
                      color: Colors.grey,
                      textColor: Colors.white,
                      onPressed: (){
                        Presenter.selectProgram(context, Programs.intermediate);
                      },
                    )
                  ),
                ),
            ),
          ],
        )
      ),
    );
  }
}