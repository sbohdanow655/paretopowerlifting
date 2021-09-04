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
            await db.execute(
              'CREATE TABLE Settings(id INTEGER PRIMARY KEY, useMicroplates BIT, weightUnit TEXT, squatPhase INTEGER, benchPressPhase INTEGER, deadliftPhase INTEGER, fullbody1 TEXT, fullbody2 TEXT, fullbody3 TEXT, split1 TEXT, split2 TEXT, split3 TEXT, split4 TEXT, squatWeight REAL, benchPressWeight REAL, deadliftWeight REAL, overheadPressWeight REAL, pendlayRowWeight REAL, skullcrusherWeight REAL)'
            );
      });

      paretoPowerliftingDB.transaction((txn) async {
        final result = await txn.rawQuery('SELECT COUNT(*) FROM Settings');
        final count = Sqflite.firstIntValue(result);
        if (count == 0) {
          paretoPowerliftingDB.transaction((txn) async {
            await txn.rawInsert(
                'INSERT INTO Settings(useMicroplates, weightUnit, squatPhase, benchPressPhase, deadliftPhase, fullbody1, fullbody2, fullbody3, split1, split2, split3, split4, squatWeight, benchPressWeight, deadliftWeight, overheadPressWeight, pendlayRowWeight, skullcrusherWeight) ' +
              'VALUES(0, "lbs", 1, 1, 1, "Monday", "Wednesday", "Friday", "Monday", "Tuesday", "Thursday", "Friday", 45, 45, 45, 45, 45, 45 )');
          });
        }
      });

      return paretoPowerliftingDB;

    } catch(e) {
      print(e);
    }

    return null;
  }

  static void updateSettings(bool useMicroplates, String weightUnit, int squatPhase, int benchPressPhase, int deadliftPhase, Weekday fullbody1, Weekday fullbody2, Weekday fullbody3, Weekday split1, Weekday split2, Weekday split3, Weekday split4, double squatWeight, double benchPressWeight, double deadliftWeight, double overheadPressWeight, double pendlayRowWeight, double skullcrusherWeight) async {
    Database paretoPowerliftingDB = await openDB();

    await paretoPowerliftingDB.rawUpdate(
      'UPDATE Settings SET useMicroplates = ' + (useMicroplates ? 1 : 0).toString() + ', weightUnit = "' + weightUnit + '", squatPhase = ' + squatPhase.toString() + ', benchPressPhase = ' + benchPressPhase.toString()+ ', deadliftPhase = ' + deadliftPhase.toString() + ', fullbody1 = "' + Constants.weekdayStrings[fullbody1] + '", fullbody2 = "' + Constants.weekdayStrings[fullbody2] + '", fullbody3 = "' + Constants.weekdayStrings[fullbody3] + '", split1 = "' + Constants.weekdayStrings[split1] + '", split2 = "' + Constants.weekdayStrings[split2] + '", split3 = "' + Constants.weekdayStrings[split3] + '", split4 = "' + Constants.weekdayStrings[split4] + '", squatWeight = ' + squatWeight.toString() + ', benchPressWeight = ' + benchPressWeight.toString() + ', deadliftWeight = ' + deadliftWeight.toString() + ', overheadPressWeight = ' + overheadPressWeight.toString() + ', pendlayRowWeight = ' + pendlayRowWeight.toString() + ', skullcrusherWeight = ' + skullcrusherWeight.toString() + ' WHERE id = 1'
      );
  }

  static Future<Map> getSettings() async {
    Database paretoPowerliftingDB = await openDB();

    try {
      List<Map> settingsMapList = await paretoPowerliftingDB.rawQuery('SELECT * FROM Settings');
      return settingsMapList[0];
    } catch(e) {
      print(e);

    }

    return {};
  }
}