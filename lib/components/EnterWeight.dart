import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  bool _validate(String text) {
    return text.isNotEmpty &&
        RegExp(r'\d+.?\d*').stringMatch(text).length == text.length;
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
              decoration: InputDecoration(labelText: Constants.EMPTYSTRING),
              maxLength: 6,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (val) {
                if (_validate(val)) {
                  _weeklyExercisePrescription.setNextWeight(_exercise, val);
                }
              },
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  if (_validate(newValue.text)) {
                    return newValue;
                  }

                  return oldValue;
                })
              ]))
    ]);
  }
}
