import 'dart:convert';

import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';

class PassFail {
  Map<String, Map<String, bool>> _passFailMap = {};

  PassFail() {
    _passFailMap = _getInitialPassFailMap();
  }

  @override
  String toString() {
    return json.encode(_passFailMap);
  }

  void setSinglePassFail(Weekday weekday, Exercise exercise, bool didPass) {
    _passFailMap[weekday.toString()][exercise.toString()] = didPass;
    DBHelper.savePassFailMapToDB(this);
  }

  bool getSinglePassFail(Weekday weekday, Exercise exercise) {
    String weekdayString = weekday.toString();

    if (_passFailMap.containsKey(weekdayString)) {
      return _passFailMap[weekday.toString()][exercise.toString()];
    }

    return true;
  }

  void setFromString(String passFailJson) {
    Map<String, Map<String, bool>> passFailMap = _getInitialPassFailMap();
    Map<String, dynamic> decodedJson1 = json.decode(passFailJson);
    decodedJson1.forEach((String weekdayString, dynamic passFailByExercise) {
      passFailByExercise.forEach((String exerciseString, dynamic didPass) {
        passFailMap[weekdayString][exerciseString] = didPass;
      });
    });
    _passFailMap = passFailMap;
  }

  Map<String, Map<String, bool>> _getInitialPassFailMap() {
    Map<String, Map<String, bool>> passFailMap = {};
    Weekday.values.forEach((weekday) {
      passFailMap[weekday.toString()] = {};
      Exercise.values.forEach((exercise) {
        passFailMap[weekday.toString()][exercise.toString()] = false;
      });
    });

    return passFailMap;
  }

  void reset() {
    _passFailMap = _getInitialPassFailMap();
    DBHelper.savePassFailMapToDB(this);
  }
}
