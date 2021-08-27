import 'package:flutter/material.dart';
import './view.dart';
import './model.dart';
import './assets/constants.dart';

class Presenter {

  static View view;

  static View run() {    
    view = View();
    return view;
  }

  static void selectProgram(context, programType) {
    Model.saveProgram(programType);
    Navigator.pushNamed(context, Constants.routeBMISurvey);
  }

  static calculateBMI(height, unitHeight, weight, unitWeight) {
    DateTime date = new DateTime.now();
    double heightInches = unitHeight == Constants.heightUnitInches ? height : height * Constants.inchesToCm;
    double weightLbs = unitWeight == Constants.weightUnitLbs ? weight : weight * Constants.kgToLbs;

    double bmi = weightLbs / heightInches / heightInches * Constants.bmiConstant;
    
    Model.saveHeight(height, unitHeight, date);
    Model.saveWeight(weight, unitWeight, date);
    Model.saveBMI(bmi, date);

    return bmi;
  }

  static getBMIMessage(bmi) {
    if (bmi < 18.5) {
      return Constants.bmiUnderweight;
    }

    if (bmi >= 25 && bmi <= 29.9) {
      return Constants.bmiNormal;
    }

    if (bmi > 29.9) {
      return Constants.bmiOverweight;
    }
  }
}

