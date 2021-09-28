import 'package:pareto_powerlifting/classes/ExerciseLog.dart';
import 'package:sqflite/sqflite.dart';
import '../assets/constants.dart';
import 'modelDB.dart';

class ExerciseLogModel {
  static void insertExerciseLog(ExerciseLog exerciseLog) async {
    Database paretoPowerliftingDB = await Model.openDB();

    await paretoPowerliftingDB.rawQuery('INSERT INTO ' +
        Constants.tableNameExerciseLogs +
        ' (' +
        Constants.ExerciseLogDB_EXERCISE +
        ', ' +
        Constants.ExerciseLogDB_WEIGHT_UNIT +
        ', ' +
        Constants.ExerciseLogDB_WEIGHT +
        ', ' +
        Constants.ExerciseLogDB_SETS +
        ', ' +
        Constants.ExerciseLogDB_REPS +
        ', ' +
        Constants.ExerciseLogDB_DIDPASS +
        ', ' +
        Constants.ExerciseLogDB_DATESTRING +
        ') ' +
        'VALUES(' +
        Model.wrapString(exerciseLog.exercise.toString()) +
        ', ' +
        Model.wrapString(exerciseLog.weightUnit) +
        ', ' +
        Model.wrapString(exerciseLog.weight) +
        ', ' +
        exerciseLog.numSets.toString() +
        ', ' +
        exerciseLog.numReps.toString() +
        ', ' +
        (exerciseLog.didPass ? '1' : '0') +
        ', ' +
        Model.wrapString(exerciseLog.savedDateString) +
        ');');
  }

  static Future<List<Map>> getLogsByExercise(Exercise exercise) async {
    Database paretoPowerliftingDB = await Model.openDB();

    try {
      List<Map> exerciseLogsMapList = await paretoPowerliftingDB.rawQuery(
          'SELECT * FROM ' +
              Constants.tableNameExerciseLogs +
              ' WHERE ' +
              Constants.ExerciseLogDB_EXERCISE +
              ' = ' +
              Model.wrapString(exercise.toString()) +
              ' ORDER BY id DESC');
      return exerciseLogsMapList;
    } catch (e) {
      print(e);
    }

    return [];
  }

  static Future<List<Map>> getAllLogs() async {
    Database paretoPowerliftingDB = await Model.openDB();

    try {
      List<Map> exerciseLogsMapList = await paretoPowerliftingDB.rawQuery(
          'SELECT * FROM ' +
              Constants.tableNameExerciseLogs +
              ' ORDER BY id DESC');
      return exerciseLogsMapList;
    } catch (e) {
      print(e);
    }

    return [];
  }
}
