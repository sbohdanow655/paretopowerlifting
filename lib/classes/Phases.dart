class Phases {
  int _squat = 1;
  int _benchPress = 1;
  int _deadlift = 1;

  Phases();

  void reset() {
    _squat = 1;
    _benchPress = 1;
    _deadlift = 1;
  }

  bool isThreeDay() {
    return _squat <= 2 && _benchPress <= 2 && _deadlift <= 2;
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
