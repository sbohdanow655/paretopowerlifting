import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/WeeklyExercisePrescription.dart';

class EnterWeight extends StatelessWidget {
  final WeeklyExercisePrescription _weeklyExercisePrescription;
  final Exercise _exercise;
  final String _exerciseString;
  final TextEditingController _textEditingController = TextEditingController();

  EnterWeight(
      this._weeklyExercisePrescription, this._exercise, this._exerciseString) {
    _textEditingController.text =
        _weeklyExercisePrescription.getNextWeight(_exercise);
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Text(_exerciseString + Constants.SUFFIX_WEIGHT,
            style: TextStyle(fontSize: Constants.FONTSIZE_TAB_SETTINGS)),
      ),
      SizedBox(
          width: 70,
          child: TextFormField(
              controller: _textEditingController,
              validator: (value) {
                if (value.isEmpty || !RegExp(r'\d+.?\d').hasMatch(value)) {
                  return "Enter A Valid Weight";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(labelText: Constants.EMPTYSTRING),
              maxLength: 6,
              keyboardType: TextInputType.number,
              onChanged: (val) =>
                  _weeklyExercisePrescription.setNextWeight(_exercise, val)))
    ]);
  }
}
