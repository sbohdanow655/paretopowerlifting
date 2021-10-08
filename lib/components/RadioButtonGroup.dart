import 'package:flutter/material.dart';
import 'package:pareto_powerlifting/assets/constants.dart';
import 'package:pareto_powerlifting/classes/ThemeManager.dart';

class RadioButtonGroup<T> extends StatelessWidget {
  final List<T> _itemList;
  final String _selectedItemText;
  final Function _onChanged;

  RadioButtonGroup(this._itemList, this._selectedItemText, this._onChanged);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _itemList.map((T item) {
          String itemText = item.toString();
          bool isSelected = itemText == _selectedItemText;

          return InkWell(
              onTap: () => {_onChanged(itemText)},
              child: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: isSelected
                      ? ThemeManager.getInstance().getPrimaryColor()
                      : ThemeManager.getInstance()
                          .getContainerBackgroundColor(),
                ),
                child: Center(
                  child: Text(
                    itemText,
                    style: TextStyle(
                      color: isSelected
                          ? ThemeManager.getInstance()
                              .getContainerBackgroundColor()
                          : ThemeManager.getInstance().getPrimaryTextColor(),
                      fontSize: Constants.FONTSIZE_RADIOBUTTON,
                    ),
                  ),
                ),
              ));
        }).toList());
  }
}
