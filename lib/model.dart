import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'assets/constants.dart';
import 'classes/Settings.dart';

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
            ' REAL, ' +
            Constants.DB_WEIGHT_BENCHPRESS +
            ' REAL, ' +
            Constants.DB_WEIGHT_DEADLIFT +
            ' REAL, ' +
            Constants.DB_WEIGHT_OVERHEADPRESS +
            ' REAL, ' +
            Constants.DB_WEIGHT_PENDLAYROW +
            ' REAL, ' +
            Constants.DB_WEIGHT_SKULLCRUSHERS +
            ' REAL)');
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

  static void updateSettings(
      bool useMicroplates,
      String weightUnit,
      int squatPhase,
      int benchPressPhase,
      int deadliftPhase,
      Weekday fullbody1,
      Weekday fullbody2,
      Weekday fullbody3,
      Weekday split1,
      Weekday split2,
      Weekday split3,
      Weekday split4,
      double squatWeight,
      double benchPressWeight,
      double deadliftWeight,
      double overheadPressWeight,
      double pendlayRowWeight,
      double skullcrusherWeight) async {
    Database paretoPowerliftingDB = await openDB();

    await paretoPowerliftingDB.rawUpdate('UPDATE Settings SET ' +
        Constants.DB_PASSFAILMAP +
        ' = \'' +
        Settings.getInstance().getPassFailJSON() +
        '\', ' +
        Constants.DB_USE_MICROPLATES +
        ' = ' +
        (useMicroplates ? 1 : 0).toString() +
        ', ' +
        Constants.DB_WEIGHT_UNIT +
        ' = "' +
        weightUnit +
        '", ' +
        Constants.DB_PHASE_SQUAT +
        ' = ' +
        squatPhase.toString() +
        ', ' +
        Constants.DB_PHASE_BENCHPRESS +
        ' = ' +
        benchPressPhase.toString() +
        ', ' +
        Constants.DB_PHASE_DEADLIFT +
        ' = ' +
        deadliftPhase.toString() +
        ', ' +
        Constants.DB_FULLBODY_ONE +
        ' = "' +
        Constants.weekdayStrings[fullbody1] +
        '", ' +
        Constants.DB_FULLBODY_TWO +
        ' = "' +
        Constants.weekdayStrings[fullbody2] +
        '", ' +
        Constants.DB_FULLBODY_THREE +
        ' = "' +
        Constants.weekdayStrings[fullbody3] +
        '", ' +
        Constants.DB_LOWERBODY_ONE +
        ' = "' +
        Constants.weekdayStrings[split1] +
        '", ' +
        Constants.DB_UPPERBODY_ONE +
        ' = "' +
        Constants.weekdayStrings[split2] +
        '", ' +
        Constants.DB_LOWERBODY_TWO +
        ' = "' +
        Constants.weekdayStrings[split3] +
        '", ' +
        Constants.DB_UPPERBODY_TWO +
        ' = "' +
        Constants.weekdayStrings[split4] +
        '", ' +
        Constants.DB_WEIGHT_SQUAT +
        ' = ' +
        squatWeight.toString() +
        ', ' +
        Constants.DB_WEIGHT_BENCHPRESS +
        ' = ' +
        benchPressWeight.toString() +
        ', ' +
        Constants.DB_WEIGHT_DEADLIFT +
        ' = ' +
        deadliftWeight.toString() +
        ', ' +
        Constants.DB_WEIGHT_OVERHEADPRESS +
        ' = ' +
        overheadPressWeight.toString() +
        ', ' +
        Constants.DB_WEIGHT_PENDLAYROW +
        ' = ' +
        pendlayRowWeight.toString() +
        ', ' +
        Constants.DB_WEIGHT_SKULLCRUSHERS +
        ' = ' +
        skullcrusherWeight.toString() +
        ' WHERE id = 1');
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

  static Future<String> getPassFailMap() async {
    Database paretoPowerliftingDB = await openDB();

    try {
      List<Map> settingsMapList = await paretoPowerliftingDB
          .rawQuery('SELECT ' + Constants.DB_PASSFAILMAP + ' FROM Settings');
      return settingsMapList[0][Constants.DB_PASSFAILMAP];
    } catch (e) {
      print(e);
    }

    return "{}";
  }
}
