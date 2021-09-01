import 'package:pareto_powerlifting/classes/IDailyPrescription.dart';
import 'package:pareto_powerlifting/classes/SingleExercisePrescription.dart';

class DailyExercisePrescription extends IDailyPrescription {
  List<SingleExercisePrescription> _prescriptionList;
  
  DailyExercisePrescription(this._prescriptionList);

  List<String> toStringList() {
    List<String> stringList = this._prescriptionList.map((prescription) {
      return prescription.toString();
    });

    return stringList;
  } 
}