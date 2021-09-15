import 'package:pareto_powerlifting/classes/PassFail.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'assets/constants.dart';

class Model {
  static const paretoPowerliftingDBString = "paretoPowerlifting.db";

  static Future<Database> openDB() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, paretoPowerliftingDBString);

      Database paretoPowerliftingDB = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE Settings(id INTEGER PRIMARY KEY, ' +
            Constants.DB_PASSFAILMAP +
            ' TEXT, ' +
            Constants.DB_USE_MICROPLATES +
            ' BIT, ' +
            Constants.DB_WEIGHT_UNIT +
            ' TEXT, ' +
            Constants.DB_PHASE_SQUAT +
            ' INTEGER, ' +
            Constants.DB_PHASE_BENCHPRESS +
            ' INTEGER, ' +
            Constants.DB_PHASE_DEADLIFT +
            ' INTEGER, ' +
            Constants.DB_FULLBODY_ONE +
            ' TEXT, ' +
            Constants.DB_FULLBODY_TWO +
            ' TEXT, ' +
            Constants.DB_FULLBODY_THREE +
            ' TEXT, ' +
            Constants.DB_LOWERBODY_ONE +
            ' TEXT, ' +
            Constants.DB_UPPERBODY_ONE +
            ' TEXT, ' +
            Constants.DB_LOWERBODY_TWO +
            ' TEXT, ' +
            Constants.DB_UPPERBODY_TWO +
            ' TEXT, ' +
            Constants.DB_WEIGHT_SQUAT +
            ' TEXT, ' +
            Constants.DB_WEIGHT_BENCHPRESS +
            ' TEXT, ' +
            Constants.DB_WEIGHT_DEADLIFT +
            ' TEXT, ' +
            Constants.DB_WEIGHT_OVERHEADPRESS +
            ' TEXT, ' +
            Constants.DB_WEIGHT_PENDLAYROW +
            ' TEXT, ' +
            Constants.DB_WEIGHT_SKULLCRUSHERS +
            ' TEXT)');
      });

      paretoPowerliftingDB.transaction((txn) async {
        final result = await txn.rawQuery('SELECT COUNT(*) FROM Settings');
        final count = Sqflite.firstIntValue(result);
        if (count == 0) {
          paretoPowerliftingDB.transaction((txn) async {
            await txn.rawInsert('INSERT INTO Settings(' +
                Constants.DB_PASSFAILMAP +
                ', ' +
                Constants.DB_USE_MICROPLATES +
                ', ' +
                Constants.DB_WEIGHT_UNIT +
                ', ' +
                Constants.DB_PHASE_SQUAT +
                ', ' +
                Constants.DB_PHASE_BENCHPRESS +
                ', ' +
                Constants.DB_PHASE_DEADLIFT +
                ', ' +
                Constants.DB_FULLBODY_ONE +
                ', ' +
                Constants.DB_FULLBODY_TWO +
                ', ' +
                Constants.DB_FULLBODY_THREE +
                ', ' +
                Constants.DB_LOWERBODY_ONE +
                ', ' +
                Constants.DB_UPPERBODY_ONE +
                ', ' +
                Constants.DB_LOWERBODY_TWO +
                ', ' +
                Constants.DB_UPPERBODY_TWO +
                ', ' +
                Constants.DB_WEIGHT_SQUAT +
                ', ' +
                Constants.DB_WEIGHT_BENCHPRESS +
                ', ' +
                Constants.DB_WEIGHT_DEADLIFT +
                ', ' +
                Constants.DB_WEIGHT_OVERHEADPRESS +
                ', ' +
                Constants.DB_WEIGHT_PENDLAYROW +
                ', ' +
                Constants.DB_WEIGHT_SKULLCRUSHERS +
                ') ' +
                'VALUES("{}", 0, "lbs", 1, 1, 1, "Monday", "Wednesday", "Friday", "Monday", "Tuesday", "Thursday", "Friday", 45, 45, 45, 45, 45, 45 )');
          });
        }
      });

      return paretoPowerliftingDB;
    } catch (e) {
      print(e);
    }

    return null;
  }

  static String _wrapString(String str) {
    return '\'' + str + '\'';
  }

  static void updateSetting(String dbColumnName, val) async {
    Database paretoPowerliftingDB = await openDB();

    switch (dbColumnName) {
      case Constants.DB_USE_MICROPLATES:
        val = (val ? 1 : 0).toString();
        break;
      case Constants.DB_WEIGHT_UNIT:
        val = _wrapString(val);
        break;
      case Constants.DB_PHASE_SQUAT:
      case Constants.DB_PHASE_BENCHPRESS:
      case Constants.DB_PHASE_DEADLIFT:
        val = val.toString();
        break;
      case Constants.DB_FULLBODY_ONE:
      case Constants.DB_FULLBODY_TWO:
      case Constants.DB_FULLBODY_THREE:
      case Constants.DB_LOWERBODY_ONE:
      case Constants.DB_UPPERBODY_ONE:
      case Constants.DB_LOWERBODY_TWO:
      case Constants.DB_UPPERBODY_TWO:
        val = _wrapString(val);
        break;
      case Constants.DB_WEIGHT_SQUAT:
      case Constants.DB_WEIGHT_BENCHPRESS:
      case Constants.DB_WEIGHT_DEADLIFT:
      case Constants.DB_WEIGHT_OVERHEADPRESS:
      case Constants.DB_WEIGHT_PENDLAYROW:
      case Constants.DB_WEIGHT_SKULLCRUSHERS:
        break;
    }

    await paretoPowerliftingDB.rawUpdate(
        'UPDATE Settings SET ' + dbColumnName + ' = ' + val + ' WHERE id = 1');
  }

  static Future<Map> getSettings() async {
    Database paretoPowerliftingDB = await openDB();

    try {
      List<Map> settingsMapList =
          await paretoPowerliftingDB.rawQuery('SELECT * FROM Settings');
      return settingsMapList[0];
    } catch (e) {
      print(e);
    }

    return {};
  }

  static Future<PassFail> getPassFailFromDB() async {
    Database paretoPowerliftingDB = await openDB();
    PassFail passFail = PassFail();
    try {
      List<Map> settingsMapList = await paretoPowerliftingDB
          .rawQuery('SELECT ' + Constants.DB_PASSFAILMAP + ' FROM Settings');
      String passFailJson = settingsMapList[0][Constants.DB_PASSFAILMAP];
      passFail.setFromString(passFailJson);
      return passFail;
    } catch (e) {
      print(e);
    }

    return PassFail();
  }

  static void savePassFailToDB(PassFail passFail) async {
    Database paretoPowerliftingDB = await openDB();

    await paretoPowerliftingDB.rawUpdate('UPDATE Settings SET ' +
        Constants.DB_PASSFAILMAP +
        ' = ' +
        _wrapString(passFail.toString()) +
        ' WHERE id = 1');
  }
}
