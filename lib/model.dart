import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'assets/constants.dart';

class Model {

  static const paretoPowerliftingDBString = "paretoPowerlifting.db";

  static Database paretoPowerliftingDB;

  static void initSettingsDB() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, paretoPowerliftingDBString);
        
      paretoPowerliftingDB = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
            await db.execute(
              'CREATE TABLE Settings(id INTEGER PRIMARY KEY, useMicroplates BIT, weightUnit TEXT, squatPhase INTEGER, benchPressPhase INTEGER, deadliftPhase INTEGER, fullbody1 TEXT, fullbody2 TEXT, fullbody3 TEXT, split1 TEXT, split2 TEXT, split3 TEXT, split4 TEXT, squatWeight REAL, benchPressWeight REAL, deadliftWeight REAL, overheadPressWeight REAL, pendlayRowWeight REAL, skullcrusherWeight REAL)'
            );
      });

      await paretoPowerliftingDB.transaction((txn) async {
        final result = await txn.rawQuery('SELECT COUNT(*) FROM Settings');
        final count = Sqflite.firstIntValue(result);
        if (count == 0) {
          await paretoPowerliftingDB.transaction((txn) async {
            await txn.rawInsert(
                'INSERT INTO Settings(useMicroplates, weightUnit, squatPhase, benchPressPhase, deadliftPhase, fullbody1, fullbody2, fullbody3, split1, split2, split3, split4, squatWeight, benchPressWeight, deadliftWeight, overheadPressWeight, pendlayRowWeight, skullcrusherWeight) ' +
              'VALUES(0, "lbs", 1, 1, 1, "Monday", "Wednesday", "Friday", "Monday", "Tuesday", "Thursday", "Friday", 45, 45, 45, 45, 45, 45 )');
          });
        }
      });

    } catch(e) {
      print(e);
    }
  }

  static void updateSettings(useMicroplates, weightUnit, squatPhase, benchPressPhase, deadliftPhase, fullbody1, fullbody2, fullbody3, split1, split2, split3, split4, squatWeight, benchPressWeight, deadliftWeight, overheadPressWeight, pendlayRowWeight, skullcrusherWeight) async {
    if (paretoPowerliftingDB == null) {
      initSettingsDB();
    }

    await paretoPowerliftingDB.rawUpdate(
        'UPDATE Settings SET useMicroplates = ?, weightUnit = ?, squatPhase = ?, benchPressPhase = ?, deadliftPhase = ?, fullbody1 = ?, fullbody2 = ?, fullbody3 = ?, split1 = ?, split2 = ?, split3 = ?, split4 = ?, squatWeight = ?, benchPressWeight = ?, deadliftWeight = ?, overheadPressWeight = ?, pendlayRowWeight = ?, skullcrusherWeight = ? WHERE id = 1',
        [useMicroplates, weightUnit, squatPhase, benchPressPhase, deadliftPhase, Constants.weekdayStrings[fullbody1], Constants.weekdayStrings[fullbody2], Constants.weekdayStrings[fullbody3], Constants.weekdayStrings[split1], Constants.weekdayStrings[split2], Constants.weekdayStrings[split3], Constants.weekdayStrings[split4], squatWeight, benchPressWeight, deadliftWeight, overheadPressWeight, pendlayRowWeight, skullcrusherWeight]);
  }

  static Future<Map>     getSettings() async {
    if (paretoPowerliftingDB == null) {
      initSettingsDB();
    }

    try {
      List<Map> settingsMapList;
      await paretoPowerliftingDB.transaction((txn) async {
        settingsMapList = await txn.rawQuery('SELECT * FROM Settings WHERE id = 1');
      });
      return settingsMapList[0];
    } catch(e) {
      print(e);

    }

    return {};
  }
}