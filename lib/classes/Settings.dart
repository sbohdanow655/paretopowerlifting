import '../assets/constants.dart';

class Settings {
  
  static Settings state;

  int _squatPhaseNumber = 1;
  int _benchPressPhaseNumber = 1;
  int _deadliftPhaseNumber = 1;
  String _weightUnit = Constants.weightUnitLbs;
  bool _useMicroplates = false;
  double _nextSquatWeight = 45;
  double _nextBenchPressWeight = 45;
  double _nextDeadliftWeight = 45;
  double _nextOverheadPressWeight = 45;
  double _nextPendlayRowWeight = 45;
  double _nextSkullcrusherWeight = 45;
  
  Settings() {
    state = this;
  }

  set squatPhaseNumber(phaseNumber) {
    _squatPhaseNumber = phaseNumber;
  }

  set benchPressPhaseNumber(phaseNumber) {
    _benchPressPhaseNumber = phaseNumber;
  }

  set deadliftPhaseNumber(phaseNumber) {
    _deadliftPhaseNumber = phaseNumber;
  }
  
  set weightUnit(weightUnit) {
    _weightUnit = weightUnit;
  }

  set useMicroplates(useMicroplates) {
    _useMicroplates = useMicroplates;
  }

  set nextSquatWeight(nextSquatWeight) {
    _nextSquatWeight = nextSquatWeight;
  }

  set nextBenchPressWeight(nextBenchPressWeight) {
    _nextBenchPressWeight = nextBenchPressWeight;
  }

  set nextDeadliftWeight(nextDeadliftWeight) {
    _nextDeadliftWeight = nextDeadliftWeight;
  }

  set nextOverheadPressWeight(nextOverheadPressWeight) {
    _nextOverheadPressWeight = nextOverheadPressWeight;
  }

  set nextPendlayRowWeight(nextPendlayRowWeight) {
    _nextPendlayRowWeight = nextPendlayRowWeight;
  }

  set nextSkullcrusherWeight(nextSkullcrusherWeight) {
    _nextSkullcrusherWeight = nextSkullcrusherWeight;
  }

  int get squatPhaseNumber {
    return _squatPhaseNumber;
  }

  int get benchPressPhaseNumber {
    return _benchPressPhaseNumber;
  }

  int get deadliftPhaseNumber {
    return _deadliftPhaseNumber;
  }
  
  String get weightUnit {
    return _weightUnit;
  }

  bool get useMicroplates {
    return _useMicroplates;
  }

  double get nextSquatWeight {
    return _nextSquatWeight;
  }
  
  double get nextBenchPressWeight {
    return _nextBenchPressWeight;
  }
  
  double get nextDeadliftWeight {
    return _nextDeadliftWeight;
  }

  double get nextOverheadPressWeight {
    return _nextOverheadPressWeight;
  }

  double get nextPendlayRowWeight {
    return _nextPendlayRowWeight;
  }

  double get nextSkullcrusherWeight {
    return _nextSkullcrusherWeight;
  }
}