import 'package:flutter/material.dart';
import '../assets/constants.dart';
import '../presenter.dart';

class Workout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WorkoutState();
  }
}

class _WorkoutState extends State<Workout> {
  
  bool haveMicroplates = false;

  String unitWeight = Constants.weightUnitLbs;

  int squatPhase = 1;
  int benchPressPhase = 1;
  int deadliftPhase = 1;

  void setMicroplates(val) {
    setState(() {
      haveMicroplates = val;
    });
  }

  void setWeightUnit(val) {
    setState(() {
      unitWeight = val;
    });
  }

  void setSquatPhase(val) {
    setState(() {
      squatPhase = val;
    });
  }

  void setBenchPressPhase(val) {
    setState(() {
      benchPressPhase = val;
    });
  }

  void setDeadliftPhase(val) {
    setState(() {
      deadliftPhase = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Row();
  }
}