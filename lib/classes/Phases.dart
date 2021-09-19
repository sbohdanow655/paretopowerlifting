import 'package:pareto_powerlifting/assets/constants.dart';

import 'DBHelper.dart';

class Phases {
  int _squat = 1;
  int _benchPress = 1;
  int _deadlift = 1;
  bool _forceFourDay = false;

  Phases();

  void reset() {
    _squat = 1;
    _benchPress = 1;
    _deadlift = 1;
  }

  bool isThreeDay() {
    if (_forceFourDay) {
      return false;
    }
    return _squat <= 2 && _benchPress <= 2 && _deadlift <= 2;
  }

  set forceFourDay(bool isForced) {
    _forceFourDay = isForced;
  }

  get forceFourDay {
    return _forceFourDay;
  }

  get squat {
    return _squat;
  }

  get benchPress {
    return _benchPress;
  }

  get deadlift {
    return _deadlift;
  }

  set squat(int squatPhase) {
    _squat = squatPhase;
  }

  set benchPress(int benchPressPhase) {
    _benchPress = benchPressPhase;
  }

  set deadlift(int deadliftPhase) {
    _deadlift = deadliftPhase;
  }
}
