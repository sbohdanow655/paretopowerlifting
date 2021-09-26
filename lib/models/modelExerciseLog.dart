import 'package:pareto_powerlifting/classes/ExerciseLog.dart';
import 'package:sqflite/sqflite.dart';
import '../assets/constants.dart';
import 'modelDB.dart';

class ExerciseLogModel {
  static void insertExerciseLog(
      ExerciseLog singleExercisePrescriptionWithPassFail) async {
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
        ') ' +
        'VALUES(' +
        Model.wrapString(
            singleExercisePrescriptionWithPassFail.exercise.toString()) +
        ', ' +
        Model.wrapString(singleExercisePrescriptionWithPassFail.weightUnit) +
        ', ' +
        Model.wrapString(singleExercisePrescriptionWithPassFail.weight) +
        ', ' +
        singleExercisePrescriptionWithPassFail.numSets.toString() +
        ', ' +
        singleExercisePrescriptionWithPassFail.numReps.toString() +
        ', ' +
        (singleExercisePrescriptionWithPassFail.didPass ? '1' : '0') +
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
