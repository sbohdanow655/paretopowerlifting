import 'dart:convert';

import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/DBHelper.dart';

class PassFail {
  Map<String, Map<String, String>> _passFailMap = {};

  PassFail() {
    _passFailMap = _getInitialPassFailMap();
  }

  @override
  String toString() {
    return json.encode(_passFailMap);
  }

  void setSinglePassFail(Weekday weekday, Exercise exercise, String passFail) {
    _passFailMap[weekday.toString()][exercise.toString()] = passFail;
    DBHelper.savePassFailMapToDB(this);
  }

  String getSinglePassFail(Weekday weekday, Exercise exercise) {
    String weekdayString = weekday.toString();

    if (_passFailMap.containsKey(weekdayString)) {
      return _passFailMap[weekday.toString()][exercise.toString()];
    }

    return Constants.FAIL;
  }

  Map<String, String> getPassFailsFromWeekday(Weekday weekday) {
    String weekdayString = weekday.toString();

    if (_passFailMap.containsKey(weekdayString)) {
      return _passFailMap[weekday.toString()];
    }

    return {};
  }

  void setFromString(String passFailJson) {
    Map<String, Map<String, String>> passFailMap = _getInitialPassFailMap();
    Map<String, dynamic> decodedJson1 = json.decode(passFailJson);
    decodedJson1.forEach((String weekdayString, dynamic passFailByExercise) {
      passFailByExercise.forEach((String exerciseString, dynamic passFail) {
        passFailMap[weekdayString][exerciseString] = passFail;
      });
    });
    _passFailMap = passFailMap;
  }

  Map<String, Map<String, String>> _getInitialPassFailMap() {
    Map<String, Map<String, String>> passFailMap = {};
    Weekday.values.forEach((weekday) {
      passFailMap[weekday.toString()] = {};
      Exercise.values.forEach((exercise) {
        passFailMap[weekday.toString()][exercise.toString()] = Constants.LIFT;
      });
    });

    return passFailMap;
  }

  void reset() {
    _passFailMap = _getInitialPassFailMap();
    DBHelper.savePassFailMapToDB(this);
  }
}
