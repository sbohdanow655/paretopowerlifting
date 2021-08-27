import 'package:flutter/material.dart';
import '../assets/constants.dart';
import '../presenter.dart';

class BMISurvey extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BMISurveyState();
  }
}

class _BMISurveyState extends State<BMISurvey> {
  
  String unitHeight = Constants.heightUnitInches;
  String unitWeight = Constants.weightUnitLbs;
  double valHeight = 0;
  double valWeight = 0;
  bool showBMIText = false;
  double bmi = 0;

  void setHeightUnit(val) {
    setState(() {
      unitHeight = val;
    });
  }

  void setWeightUnit(val) {
    setState(() {
      unitWeight = val;
    });
  }

  void setHeightValue(val) {
    setState(() {
      valHeight = val;
    });
  }

  void setWeightValue(val) {
    setState(() {
      valWeight = val;
    });
  }

@override
Widget build(BuildContext context) {
  
  return Scaffold(
    appBar: AppBar(
      title: Text(Constants.title),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter height'
                ),
                onChanged: (val) => setHeightValue(val),
              )
                
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.buttonPaddingHorizontal, vertical: Constants.buttonPaddingVertical),
              child: DropdownButton( 
                items: [
                  DropdownMenuItem(
                    child : Text(Constants.heightUnitInches),
                    value: Constants.heightUnitInches,
                  ),
                  DropdownMenuItem(
                    child : Text(Constants.heightUnitCm),
                    value: Constants.heightUnitCm,
                  ),
                ],
                value: unitHeight,
                onChanged: (val) => setHeightUnit(val),

              )
            ),
          ]
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: 200,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter weight'
                  ),
                  onChanged: (val) => setWeightValue(val),
                )
                
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Constants.buttonPaddingHorizontal, vertical: Constants.buttonPaddingVertical),
              child: DropdownButton( 
                items: [
                  DropdownMenuItem(
                    child : Text(Constants.weightUnitLbs),
                    value: Constants.weightUnitLbs,
                  ),
                  DropdownMenuItem(
                    child : Text(Constants.weightUnitKg),
                    value: Constants.weightUnitKg,
                  ),
                ],
                value: unitWeight,
                onChanged: (val) => setWeightUnit(val),
              )
            ),
          ]
          ),
          ButtonTheme(
            minWidth: 200,
            height: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Calculate your BMI"),
                  onPressed: () {
                    setState(() {
                      bmi = Presenter.calculateBMI(valHeight, unitHeight, valWeight, unitWeight);
                    });
                  }
                )
              )
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              "Your BMI is " + bmi.toString() + ". " + Presenter.getBMIMessage(bmi)
              )
          )
    ],),
    );
  }


}