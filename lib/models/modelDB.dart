import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../assets/constants.dart';

class Model {
  static String wrapString(String str) {
    return '\'' + str + '\'';
  }

  static Future<Database> openDB() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, Constants.paretoPowerliftingDBString);

      Database paretoPowerliftingDB = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE ' +
            Constants.tableNameSettings +
            '(id INTEGER PRIMARY KEY, ' +
            Constants.SettingsDB_PASSFAILMAP +
            ' TEXT, ' +
            Constants.SettingsDB_FORCEFOURDAYSPLIT +
            ' BIT, ' +
            Constants.SettingsDB_OPTIONAL_HIITCONDITIONING +
            ' BIT, ' +
            Constants.SettingsDB_OPTIONAL_CURLS +
            ' BIT, ' +
            Constants.SettingsDB_HAVE_MICROPLATES +
            ' BIT, ' +
            Constants.SettingsDB_WEIGHT_UNIT +
            ' TEXT, ' +
            Constants.SettingsDB_PHASE_SQUAT +
            ' INTEGER, ' +
            Constants.SettingsDB_PHASE_BENCHPRESS +
            ' INTEGER, ' +
            Constants.SettingsDB_PHASE_DEADLIFT +
            ' INTEGER, ' +
            Constants.SettingsDB_FULLBODY_ONE +
            ' TEXT, ' +
            Constants.SettingsDB_FULLBODY_TWO +
            ' TEXT, ' +
            Constants.SettingsDB_FULLBODY_THREE +
            ' TEXT, ' +
            Constants.SettingsDB_LOWERBODY_ONE +
            ' TEXT, ' +
            Constants.SettingsDB_UPPERBODY_ONE +
            ' TEXT, ' +
            Constants.SettingsDB_LOWERBODY_TWO +
            ' TEXT, ' +
            Constants.SettingsDB_UPPERBODY_TWO +
            ' TEXT, ' +
            Constants.SettingsDB_WEIGHT_SQUAT +
            ' TEXT, ' +
            Constants.SettingsDB_WEIGHT_BENCHPRESS +
            ' TEXT, ' +
            Constants.SettingsDB_WEIGHT_DEADLIFT +
            ' TEXT, ' +
            Constants.SettingsDB_WEIGHT_OVERHEADPRESS +
            ' TEXT, ' +
            Constants.SettingsDB_WEIGHT_PENDLAYROW +
            ' TEXT)');

        await db.execute('CREATE TABLE ' +
            Constants.tableNameExerciseLogs +
            '(id INTEGER PRIMARY KEY, ' +
            Constants.ExerciseLogDB_EXERCISE +
            ' TEXT, ' +
            Constants.ExerciseLogDB_WEIGHT_UNIT +
            ' TEXT, ' +
            Constants.ExerciseLogDB_WEIGHT +
            ' TEXT, ' +
            Constants.ExerciseLogDB_SETS +
            ' INTEGER, ' +
            Constants.ExerciseLogDB_REPS +
            ' INTEGER, ' +
            Constants.ExerciseLogDB_DIDPASS +
            ' BIT) ');
      });

      paretoPowerliftingDB.transaction((txn) async {
        final result = await txn.rawQuery('SELECT COUNT(*) FROM Settings');
        final count = Sqflite.firstIntValue(result);
        if (count == 0) {
          paretoPowerliftingDB.transaction((txn) async {
            await txn.rawInsert('INSERT INTO Settings(' +
                Constants.SettingsDB_PASSFAILMAP +
                ', ' +
                Constants.SettingsDB_FORCEFOURDAYSPLIT +
                ', ' +
                Constants.SettingsDB_OPTIONAL_HIITCONDITIONING +
                ', ' +
                Constants.SettingsDB_OPTIONAL_CURLS +
                ', ' +
                Constants.SettingsDB_HAVE_MICROPLATES +
                ', ' +
                Constants.SettingsDB_WEIGHT_UNIT +
                ', ' +
                Constants.SettingsDB_PHASE_SQUAT +
                ', ' +
                Constants.SettingsDB_PHASE_BENCHPRESS +
                ', ' +
                Constants.SettingsDB_PHASE_DEADLIFT +
                ', ' +
                Constants.SettingsDB_FULLBODY_ONE +
                ', ' +
                Constants.SettingsDB_FULLBODY_TWO +
                ', ' +
                Constants.SettingsDB_FULLBODY_THREE +
                ', ' +
                Constants.SettingsDB_LOWERBODY_ONE +
                ', ' +
                Constants.SettingsDB_UPPERBODY_ONE +
                ', ' +
                Constants.SettingsDB_LOWERBODY_TWO +
                ', ' +
                Constants.SettingsDB_UPPERBODY_TWO +
                ', ' +
                Constants.SettingsDB_WEIGHT_SQUAT +
                ', ' +
                Constants.SettingsDB_WEIGHT_BENCHPRESS +
                ', ' +
                Constants.SettingsDB_WEIGHT_DEADLIFT +
                ', ' +
                Constants.SettingsDB_WEIGHT_OVERHEADPRESS +
                ', ' +
                Constants.SettingsDB_WEIGHT_PENDLAYROW +
                ') ' +
                'VALUES("{}", 0, 0, 0, 0, "lbs", 1, 1, 1, "Monday", "Wednesday", "Friday", "Monday", "Tuesday", "Thursday", "Friday", 45, 45, 45, 45, 45 )');
          });
        }
      });

      return paretoPowerliftingDB;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
