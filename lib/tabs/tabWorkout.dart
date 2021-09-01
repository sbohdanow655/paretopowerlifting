import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/components/WorkoutDay.dart';

class Workout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WorkoutState();
  }
}

class _WorkoutState extends State<Workout> {



  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        WorkoutDay(),
        
      ]
    );
  }
}