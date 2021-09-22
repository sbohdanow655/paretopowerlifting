import 'package:pareto_powerlifting/classes/PassFail.dart';
import 'package:sqflite/sqflite.dart';
import '../assets/constants.dart';
import 'modelDB.dart';

class SettingsModel {
  static void updateSetting(String dbColumnName, val) async {
    Database paretoPowerliftingDB = await Model.openDB();

    switch (dbColumnName) {
      case Constants.SettingsDB_FORCEFOURDAYSPLIT:
      case Constants.SettingsDB_OPTIONAL_HIITCONDITIONING:
      case Constants.SettingsDB_OPTIONAL_CURLS:
      case Constants.SettingsDB_HAVE_MICROPLATES:
        val = (val ? 1 : 0).toString();
        break;
      case Constants.SettingsDB_WEIGHT_UNIT:
        val = Model.wrapString(val);
        break;
      case Constants.SettingsDB_PHASE_SQUAT:
      case Constants.SettingsDB_PHASE_BENCHPRESS:
      case Constants.SettingsDB_PHASE_DEADLIFT:
        val = val.toString();
        break;
      case Constants.SettingsDB_FULLBODY_ONE:
      case Constants.SettingsDB_FULLBODY_TWO:
      case Constants.SettingsDB_FULLBODY_THREE:
      case Constants.SettingsDB_LOWERBODY_ONE:
      case Constants.SettingsDB_UPPERBODY_ONE:
      case Constants.SettingsDB_LOWERBODY_TWO:
      case Constants.SettingsDB_UPPERBODY_TWO:
        val = Model.wrapString(Constants.weekdayStrings[val]);
        break;
      case Constants.SettingsDB_WEIGHT_SQUAT:
      case Constants.SettingsDB_WEIGHT_BENCHPRESS:
      case Constants.SettingsDB_WEIGHT_DEADLIFT:
      case Constants.SettingsDB_WEIGHT_OVERHEADPRESS:
      case Constants.SettingsDB_WEIGHT_PENDLAYROW:
      case Constants.SettingsDB_WEIGHT_SKULLCRUSHERS:
        break;
    }

    await paretoPowerliftingDB.rawUpdate('UPDATE ' +
        Constants.tableNameSettings +
        ' SET ' +
        dbColumnName +
        ' = ' +
        val +
        ' WHERE id = 1');
  }

  static Future<Map> getSettings() async {
    Database paretoPowerliftingDB = await Model.openDB();

    try {
      List<Map> settingsMapList = await paretoPowerliftingDB
          .rawQuery('SELECT * FROM ' + Constants.tableNameSettings);
      return settingsMapList[0];
    } catch (e) {
      print(e);
    }

    return {};
  }

  static Future updatePassFailFromDB(PassFail passFail) async {
    Database paretoPowerliftingDB = await Model.openDB();
    try {
      List<Map> settingsMapList = await paretoPowerliftingDB.rawQuery(
          'SELECT ' +
              Constants.SettingsDB_PASSFAILMAP +
              ' FROM ' +
              Constants.tableNameSettings);
      String passFailJson =
          settingsMapList[0][Constants.SettingsDB_PASSFAILMAP];
      passFail.setFromString(passFailJson);
    } catch (e) {
      print(e);
    }
  }

  static void savePassFailToDB(PassFail passFail) async {
    Database paretoPowerliftingDB = await Model.openDB();

    await paretoPowerliftingDB.rawUpdate('UPDATE ' +
        Constants.tableNameSettings +
        ' SET ' +
        Constants.SettingsDB_PASSFAILMAP +
        ' = ' +
        Model.wrapString(passFail.toString()) +
        ' WHERE id = 1');
  }
}
