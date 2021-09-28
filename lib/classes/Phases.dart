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
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_SQUAT, _squat);
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_BENCHPRESS, _benchPress);
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_DEADLIFT, _deadlift);
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
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_SQUAT, _squat);
  }

  set benchPress(int benchPressPhase) {
    _benchPress = benchPressPhase;
    DBHelper.saveSettingToDB(
        Constants.SettingsDB_PHASE_BENCHPRESS, _benchPress);
  }

  set deadlift(int deadliftPhase) {
    _deadlift = deadliftPhase;
    DBHelper.saveSettingToDB(Constants.SettingsDB_PHASE_DEADLIFT, _deadlift);
  }
}
