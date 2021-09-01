import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';

class DailyRestPrescription extends IDailyPrescription {
  DailyRestPrescription();

  List<String> toStringList() {
    List<String> stringList = ["Rest Day"];
    return stringList;
  }
}