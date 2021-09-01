import '../assets/constants.dart';

class SettingsState {
  
  static SettingsState settingsState;

  int _squatPhaseNumber = 1;
  int _benchPressPhaseNumber = 1;
  int _deadliftPhaseNumber = 1;
  String _weightUnit = Constants.weightUnitLbs;
  bool _useMicroplates = false;

  SettingsState() {
    settingsState = this;
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
}