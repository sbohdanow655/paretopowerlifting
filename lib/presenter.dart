import './view.dart';
import 'classes/DBHelper.dart';
import 'classes/WeeklyExercisePrescription.dart';

class Presenter {
  static View view;

  static View run() {
    view = View();
    return view;
  }
}
